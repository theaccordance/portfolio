import axios from "axios";


export default async function ({strapi}) {
  const uid = "api::vinyl.vinyl"
  const collectionIds = await strapi.entityService.findMany(uid, {fields: ["release_id", "id"]});
  const collectionMap = collectionIds.reduce((map, item) => {
    map[item.release_id] = item.id;
    return map;
  }, {});


  async function fetchDiscordsCollection() {

    await axios.get(`https://api.discogs.com/users/theaccordance/collection/folders/4484615/releases?&page=1&per_page=100&token=${process.env.DISCOGS_PAT}`).then((res) => {
      const {releases} = res.data;

      for (const release of releases) {
        const newItem = {
          release_id: release.id.toString(),
          cover_image_url: release.basic_information.cover_image,
          thumbnail_image_url: release.basic_information.thumb,
          year: release.basic_information.year,
          title: release.basic_information.title,
          artist: release.basic_information.artists[0].name
        };

        // if the item exists in the collection, update it
        if (collectionMap.hasOwnProperty(newItem.release_id)) {
          console.log(`Updating record for release ${newItem.title} by ${newItem.artist}`);
          strapi.entityService.update(uid, collectionMap[newItem.release_id], {data: newItem});
        } else {
          console.log(`Creating new item for release ${newItem.title} by ${newItem.artist}`);
          strapi.entityService.create(uid, {data: newItem});
        }
      }
    });
  }

  console.log("Beginning Discogs Cron");

  return fetchDiscordsCollection();
};

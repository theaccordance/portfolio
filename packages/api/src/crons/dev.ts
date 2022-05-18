import axios from "axios";

export default async function ({strapi}) {
  const uid = "api::post.post"
  const collectionIds = await strapi.entityService.findMany(uid, {fields: ["article_id", "id"]});
  const collectionMap = collectionIds.reduce((map, item) => {
    map[item.article_id] = item.id;
    return map;
  }, {});

  async function fetchDevArticles() {
    const requestParams = {
      method: 'GET',
      url: `https://dev.to/api/articles?username=theaccordance&state=all`
    };

    await axios(requestParams).then((res) => {
      const articles = res.data;

      for (const article of articles) {
        const postItem = {
          article_id: article.id.toString(),
          title: article.title,
          url: article.url
        };

        // if the item exists in the collection, update it
        if (collectionMap.hasOwnProperty(postItem.article_id)) {
          console.log(`Updating record for post ${postItem.title}`);
          strapi.entityService.update(uid, collectionMap[postItem.article_id], {data: postItem});
        } else {
          console.log(`Creating new item for post ${postItem.title}`);
          strapi.entityService.create(uid, {data: postItem});
        }
      }
    });
  }

  console.log(`Starting dev.to cron job`);
  return fetchDevArticles();
};

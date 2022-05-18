import axios from "axios";

export default async function ({strapi}) {
  const uid = "api::article.article"
  const collectionIds = await strapi.entityService.findMany(uid, {fields: ["article_id", "id"]});
  const collectionMap = collectionIds.reduce((map, item) => {
    map[item.article_id] = item.id;
    return map;
  }, {});

  async function fetchDevArticles() {

    await axios.get(`https://dev.to/api/articles?username=theaccordance&state=all`).then((res) => {
      const articles = res.data;
      for (const article of articles) {
        const articleItem = {
          article_id: article.id.toString(),
          title: article.title,
          url: article.url,
          published: new Date(article.published_timestamp).toISOString().slice(0,10)
        };

        // if the item exists in the collection, update it
        if (collectionMap.hasOwnProperty(articleItem.article_id)) {
          console.log(`Updating record for article ${articleItem.title}`);
          strapi.entityService.update(uid, collectionMap[articleItem.article_id], {data: articleItem});
        } else {
          console.log(`Creating new item for article ${articleItem.title}`);
          strapi.entityService.create(uid, {data: articleItem});
        }
      }
    });
  }

  console.log(`Starting Cron Job:  Fetch Dev.to Articles`);
  return fetchDevArticles();
};

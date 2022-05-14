import discogs from "../src/crons/discogs";

const SCHEDULE = {
  DAILY_1AM: "0 0 1 * * *",
  EVERY_MINUTE: "*/1 * * * *"
};


const cronMap = {
  discogs: {
    task: discogs,
    options: {
      rule: SCHEDULE.DAILY_1AM
    }
  }
};

export default cronMap;

import discogs from "../src/crons/discogs";
import dev from "../src/crons/dev";

const SCHEDULE = {
  DAILY_0100: "0 0 1 * * *",
  DAILY_0200: "0 0 2 * * *",
  EVERY_MINUTE: "*/1 * * * *" // used for development testing
};


const cronMap = {
  dev: {
    task: dev,
    options: {
      rule: SCHEDULE.EVERY_MINUTE
    }
  },
  discogs: {
    task: discogs,
    options: {
      rule: SCHEDULE.DAILY_0100
    }
  }
};

export default cronMap;

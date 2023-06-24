const {
  SectorsData,
  StatesData,
  YearData,
  NgoYearData,
  NgoStatesData,
  NgoSectorsData,
} = require("../Controllers/ChartControllers");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");

const RFPRoutes = (app) => {
  app.get("/charts/sector", AuthMiddleware, SectorsData);
  app.get("/charts/state", AuthMiddleware, StatesData);
  app.get("/charts/year", AuthMiddleware, YearData);
  app.get("/charts/ngo/year", AuthMiddleware, NgoYearData);
  app.get("/charts/ngo/state", AuthMiddleware, NgoStatesData);
  app.get("/charts/ngo/sector", AuthMiddleware, NgoSectorsData);
};

module.exports = RFPRoutes;

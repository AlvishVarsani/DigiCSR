const {
  GetNgoNotification,
  updateReadStatus,
  deleteNotification,
} = require("../Controllers/NotificationControllers");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");

const NotificationRoutes = (app) => {
  app.get("/notifications", AuthMiddleware, GetNgoNotification);
  app.post("/notifications/updatestatus", AuthMiddleware, updateReadStatus);
  app.delete("/notifications/delete", AuthMiddleware, deleteNotification);
};

module.exports = NotificationRoutes;

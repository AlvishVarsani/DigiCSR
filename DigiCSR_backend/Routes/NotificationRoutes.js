const {
  GetNgoNotification,
  updateReadStatus,
  deleteNotification,
} = require("../Controllers/NotificationControllers");

const NotificationRoutes = (app) => {
  app.get("/ngo/notifications/:id", GetNgoNotification);
  app.post("/ngo/notifications/updatestatus", updateReadStatus);
  app.delete("/ngo/notifications/delete", deleteNotification);
};

module.exports = NotificationRoutes;

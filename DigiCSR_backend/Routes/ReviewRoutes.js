const {
  PostReview,
  getNGOReviews,
  deleteReview,
} = require("../Controllers/ReviewControllers");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");

const ReviewRoutes = (app) => {
  app.post("/add-review", AuthMiddleware, PostReview);
  app.get("/get-reviews/:id", AuthMiddleware, getNGOReviews);
  app.delete("/review/delete/:id", AuthMiddleware, deleteReview);
};

module.exports = ReviewRoutes;

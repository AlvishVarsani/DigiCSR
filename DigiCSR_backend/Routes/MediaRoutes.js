const {
    CreatePost,
    UpdatePost,
    DeletePost,
    GetPostById,
    GetPosts,
    uploadFile,
} = require("../Controllers/MediaPostController");
const AuthMiddleware = require("../Middlewares/AuthMiddleware");
const fileUploaderMiddleware = require("../Middlewares/fileUploaderMiddleware");

const MediaRoutes = (app) => {
    app.get("/NGO/media/allPosts", GetPosts);
    app.get("/NGO/media/post/:id", GetPostById)
    app.post("/NGO/media/createPost", AuthMiddleware, CreatePost);
    app.put("/NGO/media/update/:id", AuthMiddleware, UpdatePost);
    app.delete("/NGO/media/delete/:id", AuthMiddleware, DeletePost);

    app.post("/NGO/media/upload", fileUploaderMiddleware, uploadFile);
}

module.exports = MediaRoutes;
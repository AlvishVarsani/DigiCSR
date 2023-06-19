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
    app.get("/media/posts", GetPosts);
    app.get("/media/post/:id", GetPostById)
    app.post("/media/createPost", AuthMiddleware, CreatePost);
    app.put("/media/update/:id", AuthMiddleware, UpdatePost);
    app.delete("/media/delete/:id", AuthMiddleware, DeletePost);

    app.post("/media/upload", fileUploaderMiddleware, uploadFile);
}

module.exports = MediaRoutes;
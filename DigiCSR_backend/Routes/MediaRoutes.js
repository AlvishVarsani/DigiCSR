const {
    CreatePost,
    UpdatePost,
    DeletePost,
    GetPostById,
    GetPosts,
} = require("../Controllers/MediaPostController");

const MediaRoutes = (app) => {
    app.get("/NGO/media/allPosts", GetPosts);
    app.get("/NGO/media/post/:id", GetPostById)
    app.post("/NGO/media/createPost", CreatePost);
    app.put("/NGO/media/update/:id", UpdatePost);
    app.delete("/NGO/media/delete/:id", DeletePost);
}

module.exports = MediaRoutes;
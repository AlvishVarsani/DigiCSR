const MediaPost = require("../Models/MediaPost");

//Create New Media Post

exports.GetPostById = async (req, res) => {
  const postId = req.params.id;

  try {
    const post = await MediaPost.findById(postId).populate(
      "author",
      "ngo_name"
    );

    if (!post) {
      console.warn("here");
      return res
        .status(404)
        .json({ success: false, message: "Post not found !!" });
    }

    const postData = { ...post._doc, author: post.author.ngo_name };

    // console.log(postData);

    res.status(200).json({ success: true, postData });
  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.GetPosts = async (req, res) => {
  try {
    const posts =
      req.userType !== "ngo"
        ? await MediaPost.find().populate("author", "ngo_name")
        : await MediaPost.find({ author: req.user._id }).populate(
            "author",
            "ngo_name"
          );

    if (!posts) {
      return res
        .status(404)
        .json({ success: false, message: "No posts found !!" });
    }

    const postsData = posts.map((post) => {
      const postData = { ...post._doc, author: post.author.ngo_name };
      return postData;
    });

    return res.status(200).json({ success: true, postsData });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, message: "Internal server error." });
  }
};

exports.CreatePost = async (req, res) => {
  try {
    if (req.userType !== "ngo") {
      return res
        .status(401)
        .send({ success: false, message: "Not Authorized." });
    }

    const user = req.user;

    const { title, content } = req.body;

    if (!title || !content) {
      return res.status(400).json({
        success: false,
        message: "Title and content is require to create a post !!!",
      });
    }

    const newMediaPost = new MediaPost({
      title,
      content,
      author: user._id,
    });

    const createdMediaPost = await newMediaPost.save();

    return res.status(200).json(createdMediaPost);
  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.UpdatePost = async (req, res) => {
  try {
    if (req.userType !== "ngo") {
      return res
        .status(401)
        .send({ success: false, message: "Not Authorized." });
    }

    const postId = req.params.id;
    const { title, content, mediaUrl } = req.body;

    if (!title || !content) {
      return res.status(400).json({
        success: false,
        message: "Title and content is require to create a post !!!",
      });
    }

    const media = await MediaPost.findById(postId).populate(
      "author",
      "ngo_name"
    );

    if (!media) {
      return res
        .status(404)
        .json({ success: false, message: "Post Not Found." });
    }

    if (title) {
      media.title = title;
    }

    if (content) {
      media.content = content;
    }

    if (mediaUrl) {
      media.mediaUrl = mediaUrl;
    }

    media.updatedAt = Date.now();

    const updatedMedia = await media.save();

    const postData = {
      ...updatedMedia._doc,
      author: updatedMedia.author.ngo_name,
    };

    // console.log(postData);

    return res.status(200).json({ success: true, postData });
  } catch (err) {
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.DeletePost = async (req, res) => {
  try {
    if (req.userType !== "ngo" && req.userType !== "Admin") {
      return res
        .status(401)
        .send({ success: false, message: "Not Authorized." });
    }

    const postId = req.params.id;

    const deletedMedia = await MediaPost.findByIdAndDelete(postId);

    if (!deletedMedia) {
      return res
        .status(400)
        .json({ success: false, message: "Media post not found" });
    }

    return res
      .status(200)
      .json({ success: true, message: "Media post deleted successfully" });
  } catch (err) {
    console.log(err);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.uploadFile = (req, res) => {
  if (req.userType !== "ngo") {
    return res.status(401).send({ success: false, message: "Not Authorized." });
  }

  if (!req.fileUrl) {
    return res
      .status(400)
      .json({ success: false, message: "No file uploaded" });
  }

  const fileUrl = req.fileUrl;
  return res.status(200).json({
    success: true,
    message: "File uploaded successfully",
    url: fileUrl,
  });
};

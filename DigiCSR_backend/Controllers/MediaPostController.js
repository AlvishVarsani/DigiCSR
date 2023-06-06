const MediaPost = require("../Models/MediaPost");

//Create New Media Post

exports.GetPostById = async (req, res) => {

  const postId = req.params.id;

  try {

    const post = await MediaPost.findById(postId);

    if (!post) {
      return res.status(404).json({ success: false, message: "Post not found !!" })
    }

    res.status(200).json({ success: true, postData: post });

  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
}

exports.GetPosts = async (req, res) => {

  const authorId = "647adc51282c59958e8cd069";

  try {

    const posts = await MediaPost.find({ author: authorId });

    if (!post) {
      return res.status(404).json({ success: false, message: "No posts found !!" })
    }

    res.status(200).json({ success: true, postsData: posts });

  } catch (err) {
    console.error(err);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
}

exports.CreatePost = async (req, res) => {
  try {
    const { title, content, author, mediaUrl } = req.body;

    const newMediaPost = new MediaPost({
      title,
      content,
      author,
      mediaUrl,
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
    const postId = req.params.id;
    const { title, content, mediaUrl } = req.body;

    const media = await MediaPost.findById(postId);

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

    return res.status(200).json(updatedMedia);
  } catch (err) {
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

exports.DeletePost = async (req, res) => {
  try {
    const postId = req.params.id;

    const deletedMedia = await MediaPost.findByIdAndDelete(postId);

    if (!deletedMedia) {
      return res
        .status(400)
        .json({ success: false, message: "Media post not found" });
    }

    return res.status(200).json({ message: "Media post deleted successfully" });
  } catch (err) {
    console.log(err);
    return res
      .status(500)
      .json({ success: false, message: "Internal server error." });
  }
};

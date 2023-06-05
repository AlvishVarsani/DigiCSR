const Notification = require("../Models/Notification");
exports.GetNgoNotification = async (req, res) => {
  try {
    const id = req.params.id;
    if (!id) {
      return res
        .status(400)
        .send({ success: false, message: "Invalid ID parameter" });
    }

    const notifications = await Notification.find(
      { "recipients.recipient": { $in: id } },
      {
        _id: 1,
        content: 1,
        timestamp: 1,
        recipients: { $elemMatch: { recipient: id } },
      }
    );

    if (!notifications || notifications.length === 0) {
      return res
        .status(404)
        .send({ success: false, message: "No notifications found" });
    }

    // Extract the read status for the recipient with the given ID
    const readStatus = notifications.map((notification) => ({
      _id: notification._id,
      content: notification.content,
      timestamp: notification.timestamp,
      read: notification.recipients[0].read,
    }));

    return res.status(200).send({ success: true, notifications: readStatus });
  } catch (error) {
    return res
      .status(500)
      .send({ success: false, message: "Internal server error" });
  }
};

exports.updateReadStatus = async (req, res) => {
  try {
    const { notificationID, recipientID } = req.body;
    const notification = await Notification.findOneAndUpdate(
      {
        _id: notificationID,
        "recipients.recipient": recipientID,
      },
      {
        $set: {
          "recipients.$.read": true,
        },
      },
      { new: true }
    );

    if (!notification) {
      return res
        .status(404)
        .json({ success: false, message: "Notification not found." });
    }

    res
      .status(200)
      .json({ success: true, message: "Read status updated successfully." });
  } catch (error) {
    res
      .status(500)
      .json({ success: false, message: "Failed to update read status." });
  }
};

exports.deleteNotification = async (req, res) => {
  try {
    const { notificationID, recipientID } = req.body;

    const notification = await Notification.findOneAndUpdate(
      {
        _id: notificationID,
        "recipients.recipient": recipientID,
      },
      {
        $pull: {
          recipients: { recipient: recipientID },
        },
      },
      { new: true }
    );

    if (!notification) {
      return res
        .status(404)
        .json({ success: false, message: "Notification not found." });
    }

    // Check if recipients array is empty then delete it
    if (notification.recipients.length === 0) {
      await Notification.findByIdAndDelete(notificationID);
      return res.status(200).json({
        success: true,
        message: "Notification and recipient deleted successfully.",
      });
    }

    res.status(200).json({
      success: true,
      message: "Recipient removed from notification successfully.",
    });
  } catch (error) {
    res
      .status(500)
      .json({ success: false, message: "Failed to delete notification." });
  }
};

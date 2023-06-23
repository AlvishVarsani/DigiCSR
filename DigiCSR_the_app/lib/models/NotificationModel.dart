class NotificationModel{
  String? notificationID;
  String? content;
  String? timestamp;
  bool? read;

  NotificationModel({
    this.notificationID,
    this.content,
    this.timestamp,
    this.read
  }
  );

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      notificationID: json['_id'],
      content: json['content'],
      timestamp: json['timestamp'],
      read: json['read']
    );
  }
}
class Note {
  // String? sId;
  String? id;
  String? userId;
  String? title;
  String? content;
  DateTime? createdAt;

  Note({this.id, this.userId, this.title, this.content, this.createdAt});

  Note.fromJson(Map<String, dynamic> json) {
    // sId = json['_id'];
    id = json['id'];
    userId = json['userId'];
    title = json['title'];
    content = json['content'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['_id'] = sId;
    data['id'] = id;
    data['userId'] = userId;
    data['title'] = title;
    data['content'] = content;
    data['createdAt'] = createdAt;
    return data;
  }
}

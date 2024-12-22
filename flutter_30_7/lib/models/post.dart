class Post {
  final int? id;
  final String? title;
  final String? body;
  final String? image;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.image
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title" : title,
    "body" : body,
    "image" : image
  };

  factory Post.fromJson(Map<String, dynamic> json){
    return Post(
      id: json["id"],
      title: json["title"],
      body: json["body"],
      image: json["image"]
    );
  }
}
class Posts {
  Posts({
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    required this.featuredImage,
  });

  int id;
  DateTime date;
  String title;
  String content;
  FeaturedImage featuredImage;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    title: json["title"],
    content: json["content"],
    featuredImage: FeaturedImage.fromJson(json["featured_image"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date.toIso8601String(),
    "title": title,
    "content": content,
    "featured_image": featuredImage.toJson(),
  };
}

class FeaturedImage {
  FeaturedImage({
    this.thumbnail,
    this.mediam,
    this.large,
  });

  dynamic thumbnail;
  dynamic mediam;
  dynamic large;

  factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
    thumbnail: json["thumbnail"],
    mediam: json["mediam"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "mediam": mediam,
    "large": large,
  };
}

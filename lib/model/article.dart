class Posts {
  final int id;
  final String title;
  final String content;
  final String featuredmedia;

  Posts({
    required this.id,
    required this.title,
    required this.content,
    required this.featuredmedia,
  });

  factory Posts.formJson(Map<String, dynamic> json) {
    return new Posts(
      id: json['id'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      featuredmedia: json['yoast_head_json']['og_image'][0]['url'],
    );
  }
}

class ArticleModel {
  final String title, author, desc, url, image, publishAt, content;
  final Source source;

  ArticleModel({
    required this.title,
    required this.author,
    required this.desc,
    required this.url,
    required this.image,
    required this.publishAt,
    required this.content,
    required this.source,
  });
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      author: json['author'],
      desc: json['description'],
      url: json['url'],
      image: json['urlToImage'],
      publishAt: json['publishedAt'],
      content: json['content'],
      source: json['source'],
    );
  }
}

class Source {
  final String? id;
  final String name;

  Source({required this.id, required this.name});
}

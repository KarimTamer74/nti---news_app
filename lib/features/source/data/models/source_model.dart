class SourceModel {
  final String id;
  final String name;
  final String description;
  final String url;

  final String category;
  final String country;
  final String language;

  SourceModel({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.country,
    required this.language,
  });

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
      country: json['country'] ?? '',
      language: json['language'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'url': url,
      'category': category,
      'country': country,
      'language': language,
    };
  }
}

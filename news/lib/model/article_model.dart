import 'source_model.dart';

class ArticleModel {
  SourceModel? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  ArticleModel({
    this.source, this.author, this.title,
    this.description, this.url, this.urlToImage,
    this.publishedAt, this.content,
  });



  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      source: map['source'] != null
          ? SourceModel.fromMap(map['source'] as Map<String, dynamic>)
          : null,
      author: map['author'] != null ? map['author'] as String : "Author null",
      title: map['title'] != null ? map['title'] as String : "title Null",
      description: map['description'] != null
          ? map['description'] as String
          : "description Null",
      url: map['url'] != null
          ? map['url'] as String
          : "https://newsapi.org/",
      urlToImage: map['urlToImage'] != null
          ? map['urlToImage'] as String
          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1Df4"
          "Juop_HeRQJaL3sPC8Ctnn80e_xNKIP8u906Gz2ohhigtC7ad2W5pZx8AVrIhOn2o&usqp=CAU",
      publishedAt: map['publishedAt'] != null
          ? map['publishedAt'] as String
          : "publishedAt Null",
      content:
          map['content'] != null ? map['content'] as String : "content Null",
    );
  }
}

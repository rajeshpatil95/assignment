import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: "status")
  String status;
  @JsonKey(name: "totalResults")
  int totalResults;
  @JsonKey(name: "articles")
  List<Articles> articles;

  NewsModel({this.status, this.totalResults, this.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Articles {
  @JsonKey(name: "source")
  Source source;
  @JsonKey(name: "author")
  String author;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "urlToImage")
  String urlToImage;
  @JsonKey(name: "publishedAt")
  String publishedAt;
  @JsonKey(name: "content")
  String content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

@JsonSerializable()
class Source {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "name")
  String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

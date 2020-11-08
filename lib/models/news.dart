import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class NewsModel {
  @JsonKey(name: "batchcomplete")
  bool batchcomplete;
  @JsonKey(name: "query")
  Query query;

  NewsModel({this.batchcomplete, this.query});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable()
class Query {
  @JsonKey(name: "pages")
  List<Pages> pages;

  Query({this.pages});

  factory Query.fromJson(Map<String, dynamic> json) => _$QueryFromJson(json);
  Map<String, dynamic> toJson() => _$QueryToJson(this);
}

@JsonSerializable()
class Pages {
  @JsonKey(name: "pageid")
  int pageid;
  @JsonKey(name: "ns")
  int ns;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "index")
  int index;
  @JsonKey(name: "thumbnail")
  Thumbnail thumbnail;
  @JsonKey(name: "terms")
  Terms terms;

  Pages(
      {this.pageid,
      this.ns,
      this.title,
      this.index,
      this.thumbnail,
      this.terms});

  factory Pages.fromJson(Map<String, dynamic> json) => _$PagesFromJson(json);
  Map<String, dynamic> toJson() => _$PagesToJson(this);
}

@JsonSerializable()
class Thumbnail {
  @JsonKey(name: "source")
  String source;
  @JsonKey(name: "width")
  int width;
  @JsonKey(name: "height")
  int height;

  Thumbnail({this.source, this.width, this.height});

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class Terms {
  @JsonKey(name: "description")
  List<String> description;

  Terms({this.description});

  factory Terms.fromJson(Map<String, dynamic> json) => _$TermsFromJson(json);
  Map<String, dynamic> toJson() => _$TermsToJson(this);
}

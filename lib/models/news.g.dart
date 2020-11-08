// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
      batchcomplete: json['batchcomplete'] as bool,
      query: json['query'] == null
          ? null
          : Query.fromJson(json['query'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'batchcomplete': instance.batchcomplete,
      'query': instance.query
    };

Query _$QueryFromJson(Map<String, dynamic> json) {
  return Query(
      pages: (json['pages'] as List)
          ?.map((e) =>
              e == null ? null : Pages.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$QueryToJson(Query instance) =>
    <String, dynamic>{'pages': instance.pages};

Pages _$PagesFromJson(Map<String, dynamic> json) {
  return Pages(
      pageid: json['pageid'] as int,
      ns: json['ns'] as int,
      title: json['title'] as String,
      index: json['index'] as int,
      thumbnail: json['thumbnail'] == null
          ? null
          : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
      terms: json['terms'] == null
          ? null
          : Terms.fromJson(json['terms'] as Map<String, dynamic>));
}

Map<String, dynamic> _$PagesToJson(Pages instance) => <String, dynamic>{
      'pageid': instance.pageid,
      'ns': instance.ns,
      'title': instance.title,
      'index': instance.index,
      'thumbnail': instance.thumbnail,
      'terms': instance.terms
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return Thumbnail(
      source: json['source'] as String,
      width: json['width'] as int,
      height: json['height'] as int);
}

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'source': instance.source,
      'width': instance.width,
      'height': instance.height
    };

Terms _$TermsFromJson(Map<String, dynamic> json) {
  return Terms(
      description:
          (json['description'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$TermsToJson(Terms instance) =>
    <String, dynamic>{'description': instance.description};

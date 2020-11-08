// import 'package:json_annotation/json_annotation.dart';
// part 'search_description.g.dart';

// @JsonSerializable()
// class SearchDescriptionModel {
//   @JsonKey(name: "batchcomplete")
// 	String batchcomplete;
//   @JsonKey(name: "continue")
// 	Continue cont;
//   @JsonKey(name: "warnings")
// 	Warnings warnings;
//   @JsonKey(name: "query")
// 	Query query;

// 	SearchDescriptionModel({this.batchcomplete, this.cont, this.warnings, this.query});

//   factory SearchDescriptionModel.fromJson(Map<String, dynamic> json) =>
//       _$SearchDescriptionModelFromJson(json);
//   Map<String, dynamic> toJson() => _$SearchDescriptionModelToJson(this);
// }

// @JsonSerializable()
// class Continue {
//    @JsonKey(name: "gsroffset")
// 	int gsroffset;
//    @JsonKey(name: "cont")
// 	String cont;

// 	Continue({this.gsroffset, this.cont});

//   factory Continue.fromJson(Map<String, dynamic> json) =>
//       _$ContinueFromJson(json);
//   Map<String, dynamic> toJson() => _$ContinueToJson(this);
// }

// @JsonSerializable()
// class Warnings {
//    @JsonKey(name: "extracts")
// 	Extracts extracts;

// 	Warnings({this.extracts});

// factory Warnings.fromJson(Map<String, dynamic> json) =>
//       _$WarningsFromJson(json);
//   Map<String, dynamic> toJson() => _$WarningsToJson(this);
// }

// @JsonSerializable()
// class Extracts {
//   @JsonKey(name: "*")
// 	String flag;

// 	Extracts({this.flag});

// 	factory Extracts.fromJson(Map<String, dynamic> json) =>
//       _$ExtractsFromJson(json);
//   Map<String, dynamic> toJson() => _$ExtractsToJson(this);
// }

// @JsonSerializable()
// class Query {
//   @JsonKey(name: "pages")
// 	Pages pages;

// 	Query({this.pages});

// 	factory Query.fromJson(Map<String, dynamic> json) =>
//       _$QueryFromJson(json);
//   Map<String, dynamic> toJson() => _$QueryToJson(this);
// }

// @JsonSerializable()
// class Pages {
// 	1695229 11695229;

// 	Pages({this.11695229});

// 	Pages.fromJson(Map<String, dynamic> json) {
// 		11695229 = json['1695229'] != null ? new 1695229.fromJson(json['1695229']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.11695229 != null) {
//       data['1695229'] = this.11695229.toJson();
//     }
// 		return data;
// 	}
// }

// @JsonSerializable()
// class 1695229 {
// 	int pageid;
// 	int ns;
// 	String title;
// 	int index;
// 	String extract;

// 	1695229({this.pageid, this.ns, this.title, this.index, this.extract});

// 	1695229.fromJson(Map<String, dynamic> json) {
// 		pageid = json['pageid'];
// 		ns = json['ns'];
// 		title = json['title'];
// 		index = json['index'];
// 		extract = json['extract'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['pageid'] = this.pageid;
// 		data['ns'] = this.ns;
// 		data['title'] = this.title;
// 		data['index'] = this.index;
// 		data['extract'] = this.extract;
// 		return data;
// 	}
// }
// To parse this JSON data, do
//
//     final harryPotterModel = harryPotterModelFromJson(jsonString);

import 'dart:convert';

List<HarryPotterModel> harryPotterModelFromJson(String str) =>
    List<HarryPotterModel>.from(
      json.decode(str).map((x) => HarryPotterModel.fromJson(x)),
    );

String harryPotterModelToJson(List<HarryPotterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HarryPotterModel {
  final int? number;
  final String? title;
  final String? originalTitle;
  final String? releaseDate;
  final String? description;
  final int? pages;
  final String? cover;
  final int? index;

  HarryPotterModel({
    this.number,
    this.title,
    this.originalTitle,
    this.releaseDate,
    this.description,
    this.pages,
    this.cover,
    this.index,
  });

  factory HarryPotterModel.fromJson(Map<String, dynamic> json) =>
      HarryPotterModel(
        number: json["number"],
        title: json["title"],
        originalTitle: json["originalTitle"],
        releaseDate: json["releaseDate"],
        description: json["description"],
        pages: json["pages"],
        cover: json["cover"],
        index: json["index"],
      );

  Map<String, dynamic> toJson() => {
    "number": number,
    "title": title,
    "originalTitle": originalTitle,
    "releaseDate": releaseDate,
    "description": description,
    "pages": pages,
    "cover": cover,
    "index": index,
  };
}

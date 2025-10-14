// To parse this JSON data, do
//
//     final movies = moviesFromJson(jsonString);

import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
    final bool? ok;
    final List<Description>? description;
    final int? errorCode;

    Movies({
        this.ok,
        this.description,
        this.errorCode,
    });

    factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        ok: json["ok"],
        description: json["description"] == null ? [] : List<Description>.from(json["description"]!.map((x) => Description.fromJson(x))),
        errorCode: json["error_code"],
    );

    Map<String, dynamic> toJson() => {
        "ok": ok,
        "description": description == null ? [] : List<dynamic>.from(description!.map((x) => x.toJson())),
        "error_code": errorCode,
    };
}

class Description {
    final String? title;
    final int? year;
    final String? imdbId;
    final int? rank;
    final String? actors;
    final String? aka;
    final String? imdbUrl;
    final String? imdbIv;
    final String? imgPoster;
    final int? photoWidth;
    final int? photoHeight;

    Description({
        this.title,
        this.year,
        this.imdbId,
        this.rank,
        this.actors,
        this.aka,
        this.imdbUrl,
        this.imdbIv,
        this.imgPoster,
        this.photoWidth,
        this.photoHeight,
    });

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        title: json["#TITLE"],
        year: json["#YEAR"],
        imdbId: json["#IMDB_ID"],
        rank: json["#RANK"],
        actors: json["#ACTORS"],
        aka: json["#AKA"],
        imdbUrl: json["#IMDB_URL"],
        imdbIv: json["#IMDB_IV"],
        imgPoster: json["#IMG_POSTER"],
        photoWidth: json["photo_width"],
        photoHeight: json["photo_height"],
    );

    Map<String, dynamic> toJson() => {
        "#TITLE": title,
        "#YEAR": year,
        "#IMDB_ID": imdbId,
        "#RANK": rank,
        "#ACTORS": actors,
        "#AKA": aka,
        "#IMDB_URL": imdbUrl,
        "#IMDB_IV": imdbIv,
        "#IMG_POSTER": imgPoster,
        "photo_width": photoWidth,
        "photo_height": photoHeight,
    };
}

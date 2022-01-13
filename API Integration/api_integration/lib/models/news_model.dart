// To parse this JSON data, do
//
//     final newsModelApi = newsModelApiFromJson(jsonString);

import 'dart:convert';

NewsModelApi newsModelApiFromJson(String str) => NewsModelApi.fromJson(json.decode(str));

String newsModelApiToJson(NewsModelApi data) => json.encode(data.toJson());

class NewsModelApi {
    NewsModelApi({
        required this.status,
       required this.totalResults,
      required  this.articles,
    });

    String status;
    int totalResults;
    List<Article> articles;

    factory NewsModelApi.fromJson(Map<String, dynamic> json) => NewsModelApi(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    Article({
        required this.source,
       required  this.author,
       required  this.title,
       required  this.description,
       required  this.url,
       required  this.urlToImage,
       required  this.publishedAt,
       required  this.content,
    });

    Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description == null ? null : description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}

class Source {
    Source({
       required  this.id,
       required  this.name,
    });

    String id;
    String name;

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
    };
}

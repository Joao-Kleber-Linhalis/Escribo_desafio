import 'package:flutter/material.dart';

class Book with ChangeNotifier {
  int? id;
  String title;
  String author;
  String cover_url;
  String download_url;
  bool isFavorite;

  Book({
    this.isFavorite = false,
    this.id,
    required this.title,
    required this.author,
    required this.cover_url,
    required this.download_url,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json['id'],
        title: json['title'],
        author: json['author'],
        cover_url: json['cover_url'],
        download_url: json['download_url'],
  );

  static List<Book> listFromJson(List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => Book.fromJson(json)).toList();
  }
}

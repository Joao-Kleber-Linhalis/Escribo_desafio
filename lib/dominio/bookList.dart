import 'package:escribo_desafio/dominio/book.dart';
import 'package:escribo_desafio/services/book_services.dart';
import 'package:flutter/material.dart';

class BookList with ChangeNotifier {
  List<Book> _bookList = [];

  List<Book> get bookList => [..._bookList];
  List<Book> get favoriteBooks =>
      _bookList.where((book) => book.isFavorite).toList();

  BookList() {
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      _bookList = await getBooks();
      notifyListeners();
    } catch (e) {
      print("Inside Future");
      print("Erro ao obter a lista de livros: $e");
    }
  }
}

Future<List<Book>> getBooks() async {
  return BookService().fetchBooks();
}

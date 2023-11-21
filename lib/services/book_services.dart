import 'dart:convert';

import 'package:escribo_desafio/dominio/book.dart';
import 'package:http/http.dart' as http;

class BookService {
  Future<List<Book>> fetchBooks() async {

    final uri = Uri.parse("https://escribo.com/books.json");
    try {
      final response = await http.get(uri);

      List<Book> books = [];

      if (response.statusCode == 200) {
        //return Book.listFromJson(json.decode(response.body));
        var booksJson = json.decode(response.body);
        for(var booksJson in booksJson){
          books.add(Book.fromJson(booksJson));
        }
        return books;
      } else {
        throw Exception("Falha ao carregar Json - ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Erro durante a requisição: $e");
    }
  }
}

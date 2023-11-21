import 'dart:io';

import 'package:escribo_desafio/dominio/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    final book = Provider.of<Book>(context, listen: false);

    return ClipRect(
      child: GridTile(
        header: GridTileBar(
          leading: Consumer<Book>(
            builder: (ctx, book, _) => IconButton(
              onPressed: () {
                book.toggleFavorite();
              },
              icon: Icon(
                book.isFavorite ? Icons.bookmark : Icons.bookmark_border,
                size: 30,
              ),
              color: book.isFavorite? Colors.red : Colors.red,
            ),
          ),
          
        ),
        footer: GridTileBar(
          title: FittedBox(
            child: Text(
              book.title,
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: FittedBox(
            child: Text(
              book.author,
              textAlign: TextAlign.center,
            ),
          ),
          backgroundColor: Colors.black54,
        ),
        child: GestureDetector(
          child: Image.network(
            book.cover_url,
            fit: BoxFit.contain,
          ),
          onTap: () {
          },
        ),
      ),
    );
  }

}

import 'package:escribo_desafio/components/book_item.dart';
import 'package:escribo_desafio/dominio/book.dart';
import 'package:escribo_desafio/dominio/bookList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookGrid extends StatelessWidget {
  final bool showFavoriteOnly;

  BookGrid({required this.showFavoriteOnly});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BookList>(context);
    final List<Book> loadedBooks =
        showFavoriteOnly ? provider.favoriteBooks : provider.bookList;

    return OrientationBuilder(
      builder: (context, orientation) {
        int crossAxisCount = (orientation == Orientation.portrait) ? 2 : 6;
        return GridView.builder(
          padding: const EdgeInsets.all(5),
          itemCount: loadedBooks.length,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            value: loadedBooks[index],
            child: BookItem(),
          ),
        );
      },
    );
  }
}

import 'dart:io';

import 'package:escribo_desafio/dominio/book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

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
              color: book.isFavorite ? Colors.red : Colors.red,
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
          onTap: () async {
            _downloadFile(book);
          },
        ),
      ),
    );
  }

  void _downloadFile(Book book) async {
    var path = "/storage/emulated/0/Documents/${book.title}.epub";
    var file = File(path);
    if (!await file.exists()) {
      var response = await get(Uri.parse(book.download_url));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        print("Arquivo baixado com sucesso");
      } else {
        print("Erro ao baixar o arquivo: ${response.statusCode}");
        return;
      }
    }
    _openBook(path);
  }

  void _openBook(var path) async {
    VocsyEpub.setConfig(
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      nightMode: true,
      enableTts: true,
    );
    VocsyEpub.locatorStream.listen(
      (Locator) {},
    );
    VocsyEpub.open(
      path,
    );
  }
}

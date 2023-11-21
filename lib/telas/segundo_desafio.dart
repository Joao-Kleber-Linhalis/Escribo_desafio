import 'package:escribo_desafio/components/book_grid.dart';
import 'package:flutter/material.dart';

enum FilterOptions {
  favorite,
  all,
}

class SegundoDesafio extends StatefulWidget {
  const SegundoDesafio({super.key});

  @override
  State<SegundoDesafio> createState() => _SegundoDesafioState();
}

class _SegundoDesafioState extends State<SegundoDesafio> {
  void changeShowFavorite(bool valor) {
    _showFavoriteOnly = valor;
    print(_showFavoriteOnly);
    setState(() {});
  }

  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //title: Text("Segundo Desafio"),
        actions: [
          MenuItemButton(
            child: Text("Livros"),
            onPressed: () {
              changeShowFavorite(false);
            },
          ),
          MenuItemButton(
            child: Text("Favoritos"),
            onPressed: () {
              changeShowFavorite(true);
            },
          )
        ],
      ),
      body: BookGrid(showFavoriteOnly: _showFavoriteOnly),
    );
  }
}

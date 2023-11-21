import 'package:escribo_desafio/telas/permissao.dart';
import 'package:escribo_desafio/telas/primeiro_desafio.dart';
import 'package:escribo_desafio/telas/segundo_desafio.dart';
import 'package:escribo_desafio/uteis/nav.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Escribo Desafio",
        ),
        centerTitle: true,
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                push(context, PrimeiroDesafio(),replace: false);
              },
              child: Text('Primeiro Desafio'),
            ),
            ElevatedButton(
              onPressed: (){
                push(context, Permissao(),replace: false);
              },
              child: Text('Segundo Desafio'),
            )
          ],
        ),
      ),
    );
  }
}

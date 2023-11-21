import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../uteis/widgets/CampoTextFormField.dart';
import '../uteis/widgets/botao.dart';

class PrimeiroDesafio extends StatefulWidget {
  const PrimeiroDesafio({super.key});

  @override
  State<PrimeiroDesafio> createState() => _PrimeiroDesafioState();
}

class _PrimeiroDesafioState extends State<PrimeiroDesafio> {
  int _total = 0;
  TextEditingController numeroController = TextEditingController();

  _soma(int numero) {
    _total = 0;
    setState(() {
      for (int i = 0; i < numero; i++) {
        if (i % 3 == 0 || i % 5 == 0) {
          _total += i;
        }
      }
      print(_total);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Primeiro Desafio"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: CampoTextFormField(
                "Número para fazer a soma",
                teclado: const TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                controlador: numeroController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Text(
              "Resposta: $_total",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Botao(
              texto: "Realizar Soma",
              ao_clicar: () {
                _soma(int.parse(numeroController.text));
              },
              cor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

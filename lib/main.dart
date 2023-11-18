import 'package:escribo_desafio/uteis/widgets/CampoTextFormField.dart';
import 'package:escribo_desafio/uteis/widgets/botao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Escribo Desafio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Escribo Desafio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        title: Text(widget.title),
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

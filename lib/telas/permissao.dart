import 'package:device_info_plus/device_info_plus.dart';
import 'package:escribo_desafio/telas/segundo_desafio.dart';
import 'package:escribo_desafio/uteis/nav.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissao extends StatefulWidget {
  const Permissao({super.key});

  @override
  State<Permissao> createState() => _PermissaoState();
}

Future<bool> _request_per(Permission permission) async {
  AndroidDeviceInfo build = await DeviceInfoPlugin().androidInfo;
  if (build.version.sdkInt >= 30) {
    var re = await Permission.manageExternalStorage.request();
    if (re.isGranted) {
      return true;
    } else {
      return false;
    }
  } else {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}

class _PermissaoState extends State<Permissao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permitir Download e Leitura de Arquivos"),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () async {
          if(await _request_per(Permission.storage) ==true){
            push(context, SegundoDesafio(),replace: true);
          }
          else{
            pop(context);
          }
        },
        child: Text("Permitir"),
      )),
    );
  }
}

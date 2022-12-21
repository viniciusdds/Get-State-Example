import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eadiaurora.com',
      theme: ThemeData(
          primarySwatch: Colors.red
      ),
      home: const HomePage(),
    );
  }
}

// Home Screen
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // esta função é disparada quando o botão "Show Dialog" é pressionado
  void _showDialog() async {
    await Get.dialog(AlertDialog(
      title: const Text('Titulo da Janela'),
      content: const Text('Esta é o conteúdo da janela'),
      actions: [
        TextButton(onPressed: (){
          Get.back();
        }, child: const Text('Fechar'))
      ],
    ));

    // Codigo que executa depois do disparo da janela
    debugPrint('Janela Fechada');
  }

  // Esta função é dispatada quando o botão "Show SnackBar" é pressionado
  void _showSnackBar(){
    Get.snackbar(
        'Titulo Snackbar',
        'Esta é um snackbar bonitinho',
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING
    );
  }

  // Esta função é disparada quando o botão "Show BottomSheet" é pressionado
  void _showBottomSheet() async {
    await Get.bottomSheet(
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.redAccent,
          child: const Center(
            child: Text('Botão Sheet Content'),
          ),
        )
    );

    // O codigo abaixo vai executar depois o bottom sheet finalizar
    debugPrint('O Bottom Sheet has gone away!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eadiaurora.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed:_showDialog,
                child: const Text('Show Dialog')
            ),
            ElevatedButton(
                onPressed: _showSnackBar,
                child: const Text('Show SnackBar')
            ),
            ElevatedButton(
                onPressed: _showBottomSheet,
                child: const Text('Show BottomSheet')
            )
          ],
        ),
      ),
    );
  }
}
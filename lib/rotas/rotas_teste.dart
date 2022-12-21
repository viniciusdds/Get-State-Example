import 'package:flutter/material.dart';
import 'dart:math';
import 'package:get/get.dart';
import 'package:get_state_example/request_api/api_request.dart';

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
          colorScheme: const ColorScheme.light(
            primary: Colors.indigo,
          )
      ),
      home: const HomePage(),
      getPages: [
        GetPage(name: '/page-three', page: () => const PageThree()),
        GetPage(name: '/page-four/:data', page: () => const PageFour())
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eadiaurora.com'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Navegação entre classes de tela'),
            ElevatedButton(
                onPressed: () => Get.to(const PageOne(), arguments: {
                  'id': Random().nextInt(1000).toString()
                }),
                child: const Text('Vai para a primeira pagina')
            ),
            ElevatedButton(
                onPressed: () => Get.off(const PageTwo(), arguments: {
                  'id': Random().nextInt(1000).toString()
                }),
                child: const Text('Vai para a segunda pagina (sem voltar)')
            ),
            const Divider(),
            const Text('Navegação usando rotas nomeadas'),
            OutlinedButton(
                onPressed: () => Get.toNamed('/page-three',
                    arguments: {
                      'id': Random().nextInt(1000).toString()
                    }
                ),
                child: Text('Vai para a terceira')
            ),
            OutlinedButton(
                onPressed: () => Get.toNamed(
                    '/page-four/${Random().nextInt(1000)}'
                ),
                child: const Text('Vai para a quarta pagina')
            )
          ],
        ),
      ),
    );
  }
}

// Pagina 1
class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Center(
        child: Text(
          Get.arguments['id'] ?? 'Pagina 1',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// Pagina 2
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.off(const HomePage()),
          child: const Text('Volta para Home'),
        ),
      ),
    );
  }
}

// Pagina 3
class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 3'),
      ),
      body: Center(
        child: Text(
          Get.arguments['id'] ?? 'Pagina 3',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

// Pagina 4
class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 4'),
      ),
      body: Center(
        child: Text(
          Get.parameters['data'] ?? 'Pagina 4',
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
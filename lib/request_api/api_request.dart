import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
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
          primarySwatch: Colors.blue
      ),
      home: const KindaCodeDemo(),
    );
  }
}


class KindaCodeDemo extends StatefulWidget {
  const KindaCodeDemo({Key? key}) : super(key: key);

  @override
  _KindaCodeDemoState createState() => _KindaCodeDemoState();
}

class _KindaCodeDemoState extends State<KindaCodeDemo> {

  // Inicializa a instancia do GetConnect
  final _connect = GetConnect();

  // Envia o request e obtem a resposta
  void _sendGetRequest() async {
    final response = await _connect.get('https://jsonplaceholder.typicode.com/posts/1');

    if(kDebugMode){
      print(response.body);
    }
  }

  // Você pode de qualquer forma executar esta função, por exemplo quando o usuário clica no botão
  void _sendPostRequest() async {
    final response = await _connect.post('https://jsonplaceholder.typicode.com/posts',
        {
          'title': 'um dois tres',
          'body': 'quatro cinco seis sete',
          'userId': 1,
        }
    );

    if(kDebugMode){
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eadiaurora.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: _sendGetRequest,
                child: const Text('Enviar GET Request')
            ),
            ElevatedButton(
                onPressed: _sendPostRequest,
                child: const Text('Enviar POST Request')
            )
          ],
        ),
      ),
    );
  }
}
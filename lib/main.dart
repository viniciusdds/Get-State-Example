// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_state_example/screens/home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       // Remove the debug banner
//       debugShowCheckedModeBanner: false,
//       title: 'Kindacode.com',
//       theme: ThemeData(
//         // enable Material 3
//           primarySwatch: Colors.indigo),
//       home: HomeScreen(),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eadiaurora.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Crie uma instancia do GetConnect
  final GetConnect _connect = GetConnect(
    timeout: const Duration(seconds: 10),
  );

  final loading = false.obs;

  File? _image;

  final _picker = ImagePicker();

  // Implementando o image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if(pickedImage != null){
      setState(() {
        _image = File(pickedImage.path);

      });
    }


  }

  Future enviaFile() async {

     loading.value = true;

    //print(_image!.path);
    // Você pode fazer upload de multiplos arquivos em um mesmo POST request
    final FormData _formData = FormData({
      'file1': MultipartFile(File(_image!.path), filename: 'Manutencao1.png')
    });
    try{
      final Response res = await _connect.post(
          'https://clients.eadiaurora.com.br/MyCMS/clienteAG/upload_teste.php',
           _formData,
          headers: {
            'contentType': 'multipart/form-data'
          },
      );

      loading.value = false;
      print(res.body);
    }catch(err){
      loading.value = false;
      print(err);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eadiaurora.com'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  child: const Text('Selecione uma Imagem'),
                  onPressed: _openImagePicker,
                ),
              ),
              const SizedBox(height: 35),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 300,
                color: Colors.grey.shade300,
                child: _image != null ? Image.file(_image!, fit: BoxFit.cover)
                : const Text('Por favor selecione uma imagem'),
              ),
              Obx(() => ElevatedButton(
                    onPressed: loading.value ? null : enviaFile,
                    child: loading.value ? Text("Aguarde...") : Text("Fazer Upload")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




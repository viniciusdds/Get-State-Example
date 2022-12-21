
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main () => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eadiaurora.com',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: const KindaCodeDemo(),
    );
  }
}

class FullScreenSearchModal extends ModalRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 20
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                          suffixIcon: const Icon(Icons.close),
                          hintText: 'Pesquisar Eadiaurora.com',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30)
                          )
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text('Cancelar')
                  )
                ],
              ),

              const Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Pesquisas Recentes',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              const ListTile(
                title: Text('Tutorial Flutter'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),

              const ListTile(
                title: Text('Como fritar um frango'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),

              const ListTile(
                title: Text('Eadiaurora.com'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),

              const ListTile(
                title: Text('Tchau Mundo'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),

              const ListTile(
                title: Text('Pantufas Fofas'),
                leading: Icon(Icons.search),
                trailing: Icon(Icons.close),
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
            begin: const Offset(0, -1),
            end: Offset.zero
        ).animate(animation),
        child: child,
      ),
    );
  }
}


class KindaCodeDemo extends StatelessWidget {
  const KindaCodeDemo({Key? key}) : super(key: key);

  void _showModal(BuildContext context){
    Navigator.of(context).push(FullScreenSearchModal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eadiaurora.com'),
        actions: [
          IconButton(
              onPressed: () => _showModal(context),
              icon: const Icon(Icons.search)
          )
        ],
      ),
    );
  }
}

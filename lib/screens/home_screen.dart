import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_example/screens/wish_list_screen.dart';
import 'package:get_state_example/state/products.dart';

class HomeScreen extends StatelessWidget {

  // Instancia da nossa classe Produto usando a injeção de dependencia Get.put()
  final Products _p = Get.put(Products());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eadiaurora.com'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          // Este botão também mostra quantos itens na lista fazem vocÊ ir na lista de desejos
          InkWell(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.red,
              alignment: Alignment.center,
              // Usado Obx() => para atualizar o Text() sempre que a lista sofra uma mudança
              child: Obx(() => Text(
                'Wish List: ${_p.wishListItems.length}',
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white
                ),
              )),
            ),
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => WishListScreen()));
            },
          ),

          const SizedBox(
            height: 20,
          ),

          Expanded(
            // Exibe todos os produtos na home screen
            child: ListView.builder(
              itemCount: _p.items.length,
              // Lista de itens
              itemBuilder: (context, index){

                final product = _p.items[index];

                return Card(
                  key: ValueKey(product.id),
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                  ),
                  color: Colors.amber.shade300,
                  child: ListTile(
                    title: Text(product.name),
                    subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                    trailing: Obx(() => IconButton(
                      onPressed: (){
                        if(product.inWishList.value == false){
                           _p.addItem(product.id);
                        }else{
                           _p.removeItem(product.id);
                        }
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: product.inWishList.value == false ?
                            Colors.white : Colors.red
                      ),
                    )),
                  ),
                );

              },
            ),
          )
        ],
      ),
    );
  }
}

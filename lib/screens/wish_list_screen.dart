import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_state_example/state/products.dart';

class WishListScreen extends StatelessWidget {

  // Resposta para obter o nosso find "controller"
  final Products _p = Get.find<Products>();

  WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WishList'),
      ),
      body: Obx(() => ListView.builder(
           itemCount: _p.wishListItems.length,
           itemBuilder: (context, index){

             final item = _p.wishListItems[index];

             return Card(
               key: ValueKey(item.id),
               margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
               color: Colors.blue.shade200,
               child: ListTile(
                 title: Text(item.name),
                 subtitle: Text(item.price.toStringAsFixed(2)),
                 trailing: IconButton(
                   icon: const Icon(Icons.close),
                   onPressed: (){
                     item.inWishList.value = false;
                     _p.removeItem(item.id);
                   },
                 ),
               ),
             );

           },
         )
      ),
    );
  }
}

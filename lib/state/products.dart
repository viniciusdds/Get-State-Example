import 'package:get/get.dart';
import 'dart:math';

import 'package:get_state_example/models/item.dart';


class Products extends GetxController {

  // Em produto, estas coisas geralmente serão carregadas da API or banco de dados
  final RxList<Item> _items = List.generate(100, (index) => Item(
         id: index,
         name: 'Product $index',
         price: Random().nextDouble() * 100,
         inWishList: false.obs)
  ).obs;

  // Isto é usado para recuperar todos os produtos
  List<Item> get items {
    return [..._items];
  }

  // Isto retornará os produtos que estão adicionadas na lista de desejos
  List<Item> get wishListItems {
    return _items.where((item) => item.inWishList.value == true).toList();
  }

  // Adicionado o item na lista de desejos
  void addItem(int id) {
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = true;
  }

  // Remove um item da lista de desejos
  void removeItem(int id){
    final int index = _items.indexWhere((item) => item.id == id);
    _items[index].inWishList.value = false;
  }

}
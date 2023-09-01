import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/app/models/cart_model.dart';

class CartPageController extends ChangeNotifier {
  bool isLoading = true;
  List<CartModel> data = [];
  double? total;

  void fetch() async {
    data = [];
    isLoading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');

    if (items != null) {
      data.addAll(items.map((e) => CartModel.fromJson(jsonDecode(e))));
    }

    total = await getTotal();

    isLoading = false;
    notifyListeners();
  }

  Future<double> getTotal() async {
    double total = 0.0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        CartModel data = CartModel.fromJson(jsonDecode(items[i]));
        for (int index = 0; index < data.quantidade!; index++) {
          total += double.parse(data.preco!.replaceAll(',', '.'));
        }
      }
    }
    return total;
  }

  void upgradeData() async {
    data = [];
    notifyListeners();
  }

  void removeAllItemsToCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('items');
    upgradeData();
  }

  void removeItem(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    items!.removeAt(index);
    await prefs.setStringList('items', items);
    fetch();
  }

  void incrementQuantidade(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    CartModel data = CartModel.fromJson(jsonDecode(items![index]));
    int quantidade = data.quantidade! + 1;
    Map map = {
      "id": data.id,
      "nome": data.nome,
      "preco": data.preco,
      "peso": data.peso,
      "image": data.image,
      "quantidade": quantidade,
    };
    items[index] = jsonEncode(map);
    await prefs.setStringList('items', items);
    fetch();
  }

  void decrementQuantidade(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? items = prefs.getStringList('items');
    CartModel data = CartModel.fromJson(jsonDecode(items![index]));
    int quantidade = data.quantidade! - 1;
    if (quantidade != 0) {
      Map map = {
        "id": data.id,
        "nome": data.nome,
        "preco": data.preco,
        "peso": data.peso,
        "image": data.image,
        "quantidade": quantidade,
      };
      items[index] = jsonEncode(map);
      await prefs.setStringList('items', items);
    }
    fetch();
  }
}

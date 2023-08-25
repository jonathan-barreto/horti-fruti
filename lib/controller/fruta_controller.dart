import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/model/cart_model.dart';
import 'package:store/model/fruta_model.dart';

class FrutaController extends ChangeNotifier {
  bool isLoading = true;
  List<FrutaModel> data = [];
  int itemsTotal = 0;

  void fetch() async {
    isLoading = true;
    var url = Uri.parse('http://192.168.0.106/hortifruti/');
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    data.addAll(json.map((e) => FrutaModel.fromJson(e)));
    returnLenghtToCart();
    isLoading = false;
    notifyListeners();
  }

  void addToCart(FrutaModel data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('items');
    int index = 0;

    Map map = {
      "id": data.id,
      "nome": data.nome,
      "preco": data.preco,
      "peso": data.peso,
      "image": data.image,
      "quantidade": 1,
    };

    String json = jsonEncode(map);
    bool jsonJaExiste = false;

    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        CartModel cartItem = CartModel.fromJson(jsonDecode(items[i]));
        if (cartItem.id == data.id) {
          jsonJaExiste = true;
          index = i;
          break;
        }
      }
    }

    if (items == null) {
      items = [json];
    } else {
      if (!jsonJaExiste) {
        items.add(json);
      } else {
        CartModel data = CartModel.fromJson(jsonDecode(items[index]));
        int quantidade = data.quantidade!;
        quantidade++;
        Map newMap = {
          "id": data.id,
          "nome": data.nome,
          "preco": data.preco,
          "peso": data.peso,
          "image": data.image,
          "quantidade": quantidade,
        };
        items[index] = jsonEncode(newMap);
      }
    }

    await prefs.setStringList('items', items);
    itemsTotal = items.length;
    notifyListeners();
  }

  void removeToCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('items');
    returnLenghtToCart();
    notifyListeners();
  }

  Future<void> returnLenghtToCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('items');
    itemsTotal = items?.length ?? 0;
  }
}

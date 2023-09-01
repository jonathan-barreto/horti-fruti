import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store/app/models/cart_model.dart';
import 'package:store/app/models/home_page_model.dart';
import 'package:store/constantes.dart';

class HomePageController extends ChangeNotifier {
  bool isLoading = true;
  List<HomePageModel> data = [];
  int itemsTotal = 0;

  void showLoading() {
    isLoading = true;
    notifyListeners();
  }

  void hideLoading() {
    isLoading = false;
    notifyListeners();
  }

  void fetch() async {
    showLoading();
   
    var url = Uri.parse(Url.url);
    var response = await http.get(url);
    var json = jsonDecode(response.body) as List;
    data.addAll(json.map((e) => HomePageModel.fromJson(e)));

    returnLenghtToCart();
    hideLoading();
  }

  void addToCart(HomePageModel data) async {
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

  Future<void> returnLenghtToCart() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? items = prefs.getStringList('items');
    itemsTotal = items?.length ?? 0;
    notifyListeners();
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:e_katalog/katalog/apimodel.dart';

class Repository {
  final _baseURL = 'https://alisatia.000webhostapp.com/restfulapi/product.php';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        Iterable it = jsonDecode(response.body);
        List<Produk> produk =
            it.map((e) => Produk.fromJson(e)).toList();
        return produk;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
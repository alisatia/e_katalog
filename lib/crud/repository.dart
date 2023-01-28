import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:e_katalog/crud/model.dart';

class Repository {
  final _baseURL = 'https://63c17651376b9b2e647c52ae.mockapi.io/product/';

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

    Future deleteData(String id) async {
    try {
      final response =
          await http.delete(Uri.parse(_baseURL + id));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future postData(
    String nama, 
    String harga,
    String deskripsi,
    String gambar
  ) async {
    try {
      final response = await http.post(
        Uri.parse(_baseURL),
        body: {
          "nama": nama, 
          "harga": harga,
          "deskripsi": deskripsi,
          "gambar": gambar
        }
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future putData(
    int id, 
    String nama, 
    String harga,
    String deskripsi,
    String gambar
  ) async {
    try {
      final response = await http.put(Uri.parse(_baseURL + id.toString()),
        body: {
          'nama': nama, 
          'harga': harga,
          'deskripsi': deskripsi,
          'gambar': gambar
        }
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint((e.toString()));
    }
  }
}
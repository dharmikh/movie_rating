import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ratig/Screen/Model/HomeMoel.dart';

class Movie {
  Future<HomeMoel?> moviedata(String search) async {
    var respons = await http.get(
        Uri.parse("https://imdb8.p.rapidapi.com/auto-complete?q=$search"),
        headers: {
          "X-RapidAPI-Key":"950c4596b1mshfbc2e0288daa181p18b077jsnf5610bf4fadb",
          "X-RapidAPI-Host":"imdb8.p.rapidapi.com",
        }
    );
    if(respons.statusCode==200)
    {
      print("Start============");
      var json = jsonDecode(respons.body);
      print("=============== $json");
      return HomeMoel.fromJson(json);
    }
    else
    {
      print("=====Error");
      return null;
    }
  }
}

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
class HomeProvider extends ChangeNotifier{
TextEditingController txtScerch = TextEditingController();
String search="";
void AddData()
{
  search = txtScerch.text;
  notifyListeners();
}
}
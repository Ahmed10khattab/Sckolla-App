

import 'package:flutter/material.dart';

class tableProvider extends ChangeNotifier{
  
List<Map<String, dynamic>> filterResponse(List<Map<String, dynamic>> response) {
  List<Map<String, dynamic>> customList = [];
  
  for (var obj in response) {
    if (obj['day'] == 1) {
      customList.add(obj);
    }
  }
  
  return customList;
}


}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
 
class Pro1 extends ChangeNotifier{
List  list=[];

 storebody( var body){
list.addAll(body);
notifyListeners();
 }




List<String> formattedDates = [];
  getdata()async{ 
   formattedDates.clear();
var response=await http.get(Uri.parse('https://joker.animeraa.com/studentMob/getAttendanceDays/6450226f8bac550a5cf81fb9'));
 var data=jsonDecode(response.body);
  
    //print(data);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      for (var date in data) {
        DateTime dateTime = DateTime.parse(date);
        String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
       formattedDates.add(formattedDate);
        print(formattedDates);

        notifyListeners();

      }
 
    

 
 
  }
  }

  List<DateTime> listDate=[];
  s(List<String> dateString){
DateFormat dateFormat1 = DateFormat('yyyy-MM-dd');
listDate.clear();

for(String Date in dateString ){
DateTime dateTime = dateFormat1.parse(Date) ;

listDate.add(dateTime);
// notifyListeners();

 }
}

  
 
      }


     


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schkolla/login/splash/splash%20Screen.dart';
import 'package:schkolla/report/provider/dateProvider.dart';
 
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create:(context)=>Pro1() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Splash() ,
      ),
    );
  }
}
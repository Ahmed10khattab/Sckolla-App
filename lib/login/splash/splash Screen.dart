import 'dart:async';

import 'package:flutter/material.dart';
import 'package:schkolla/login/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 1000), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
   });
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 84, 36, 139),
        width: double.infinity,
        height: h*1,
        child:Stack(children: [
          Positioned(
            top:h*.38,
            left:w*.1 ,
            child:Container(
              height:h*0.13 ,
              width: w*.17,
              child: Image(image:AssetImage('lib/login/splash/images/1.png') ,fit: BoxFit.contain,)) ),
             Positioned(
             bottom:h*.05 ,
            left:w*.4 ,
            child:Container( height:h*0.18 ,
              width: w*.19,child: Image(image:AssetImage('lib/login/splash/images/2.png') ,fit: BoxFit.contain)) ),
             Positioned(
              top:h*.3 ,
            right:w*.1 ,
            child:Container( height:h*0.13 ,
              width: w*.17,child: Image(image:AssetImage('lib/login/splash/images/3.png') ,fit: BoxFit.contain)) ),
             Positioned(
           top:h*.1 ,
            right:w*.15 ,
            child:Container(  height:h*0.15 ,
              width: w*.19,child: Image(image:AssetImage('lib/login/splash/images/8.png') ,fit: BoxFit.contain)) ),
             Positioned(
  top:h*.1 ,
            left:w*.16 ,
            child:Container( height:h*0.13 ,
              width: w*.17,child: Image(image:AssetImage('lib/login/splash/images/5.png') ,fit: BoxFit.contain)) ),
             Positioned(
             bottom:h*.2 ,
            right:w*.1 ,
            child:Container( height:h*0.13 ,
              width: w*.17,child: Image(image:AssetImage('lib/login/splash/images/9.png') ,fit: BoxFit.contain)) ),
             Positioned(
              bottom:h*.25 ,
            left:w*.13 ,
            child:Container( height:h*0.13 ,
              width: w*.17,child: Image(image:AssetImage('lib/login/splash/images/7.png') ,fit: BoxFit.contain)) ),
          
              Center(child: Container(height: h*.2,width: w*.4,child:Image(image: AssetImage('lib/login/splash/images/4.png'),fit: BoxFit.cover,) ,))
//
       

        ],))
    );
  }
}

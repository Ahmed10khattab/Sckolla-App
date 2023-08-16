import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerForHome extends StatefulWidget {
  ContainerForHome({super.key ,@required this.colors,@required this.name,@required this.imag2,@required this.imag1});
  Color ?colors;
  String ?name;
  String ?imag1;
    String ?imag2;


  @override
  State<ContainerForHome> createState() => _ContainerForHomeState();
}

class _ContainerForHomeState extends State<ContainerForHome> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * .02, vertical: h * 0.015),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow( 
            blurRadius:h*.01,color: Color.fromARGB(255, 114, 111, 111) 
          )],
          borderRadius: BorderRadius.circular(h * .023),
          color: widget.colors!,
         //
        ),
        height: h * .11,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
               widget.name!,
               
                //  ,
                  style:GoogleFonts.tajawal(color: Colors.white, fontSize: h * .033),
                  // TextStyle(color: Colors.white, fontSize: h * .033),
                  textAlign: TextAlign.center,
                )),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    height: h * .13,
                    width: w * .34,
                    child: Image(
                      image: AssetImage(widget.imag1!),//
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: h * .006,
                      left: w * .09,
                      child:
                          Container(
                            height: h*.1,
                            width: w*.15,
                           // color: Colors.amber,
                            child: Image(
                               
                              image: AssetImage(widget.imag2!)),
                          ))//
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

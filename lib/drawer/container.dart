import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ContainerForDrawer extends StatefulWidget {
  ContainerForDrawer({super.key ,@required this.colors,@required this.name,@required this.imag2,@required this.imag1});
  Color ?colors;
  String ?name;
  String ?imag1;
    String ?imag2;


  @override
  State<ContainerForDrawer> createState() => _ContainerForHomeState();
}

class _ContainerForHomeState extends State<ContainerForDrawer> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h * .01, vertical: h * 0.01),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(h * .01),
          color: widget.colors!,
         //
        ),
        height: h * .08,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Text(
               widget.name!,
               
                //  ,
                  style:GoogleFonts.tajawal(color: Colors.white, fontSize: h * .023),
                  // TextStyle(color: Colors.white, fontSize: h * .033),
                  textAlign: TextAlign.center,
                )),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    //color: Colors.amber,
                    height: h * .5,
                    width: w * .3,
                    child: Image(
                      image: AssetImage(widget.imag1!),//
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: h * .016,
                      left: w * .058,
                      child:
                          Container(
                            height: h*.055,
                            width: w*.095,
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

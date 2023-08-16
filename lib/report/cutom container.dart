 

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerForReport extends StatefulWidget {
  ContainerForReport({super.key,required this.reportname});
  String? reportname;

  @override
  State<ContainerForReport> createState() => _ContainerForReportState();
}

class _ContainerForReportState extends State<ContainerForReport> {
  @override
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:w*.03),
      child: Column(
        children: [
            SizedBox(height: h*.04,),
          Container(decoration: BoxDecoration(
            boxShadow: [BoxShadow( 
              blurStyle: BlurStyle.outer
              ,blurRadius:h*.01,color: Color.fromARGB(255, 190, 190, 190) )],
            color:Color.fromARGB(255, 236, 235, 235),
            borderRadius:BorderRadius.circular(h*.01) 
          ),
            width: double.infinity,
            height: h*.12,
           
            child: Row(children: [
              Container(
                decoration: BoxDecoration(
                  
                  color: Color.fromARGB(255, 226, 7, 255),
                    borderRadius:BorderRadius.only(bottomLeft:Radius.circular(h*.01),topLeft: Radius.circular(h*.01) ) 
                )
                ,width:w*.02 ,),
              Expanded(
                flex: 3,
                child: Container(
                  height:h*.1 ,
                  width: w*.1,

                  child: Image(
                    
                    image:AssetImage('lib/report/image/pdf.png'),fit: BoxFit.contain, ),
                )),
                Expanded( 
                  flex: 4,
                  child:Text(widget. reportname!,style:GoogleFonts.elMessiri(  
                        fontSize: h * .03, ),  )),
                       
            ],),
          ),
           //SizedBox(height: h*.04,)
        ],
      ),
    );
  }
}
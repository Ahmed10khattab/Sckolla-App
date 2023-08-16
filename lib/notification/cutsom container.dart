import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
   import 'package:schkolla/notification/model/model.dart';
   import 'package:intl/intl.dart';
// ignore: must_be_immutable
class ContainerForNotification extends StatelessWidget {
  ContainerForNotification(
      {Key? key,
    @required this.model
      // @required this.locaton,
      // @required this.notation,
      // @required this.timeNote,
      // @required this.Date,
      //@required this.time
      })
      : super(key: key);
  // String? notation;
  // String? locaton;
  // String? time;
  // String? Date;
  // String? timeNote;
  ModelForNotif? model;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

  
// String formatDate(DateTime date, String format) {
//   return DateFormat(format).format(date);
// }


    
    return Column(
      children: [
        Container(
          width: double.infinity,
          // child: Text(
          // 'Date!  ',
          //   style: TextStyle(
          //       fontSize: h * .02, color: Color.fromARGB(162, 0, 0, 0)),
          // ),
          alignment: Alignment.center,child:Text( style: TextStyle(
                fontSize: h * .016, color: const Color.fromARGB(162, 0, 0, 0)), 
                  DateFormat('dd-MM-yyyy ').format(model!.createdAt),) ,
        ),
        SizedBox(
          height: h * 0.012,
        ),
        Container(
          margin: EdgeInsets.only(left: w * .04),
          padding: EdgeInsets.only(
              right: w * .05, top: h * .02, bottom: h * .02, left: w * .03),
          // height:h*.2,r
          //  width: w*.8,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 233, 233),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(w * .1),
                  bottomLeft: Radius.circular(w * .1),
                  topLeft: Radius.circular(w * .1)),
              boxShadow: const [
                BoxShadow(blurRadius: 10, color: Color.fromARGB(31, 0, 0, 0))
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              
              Text('ملحوظة : ' +  model!.message,
                
                  style: GoogleFonts.elMessiri(
                      fontSize: h * .022,
                      color: const Color.fromARGB(255, 15, 9, 19))),
              SizedBox(
                height: h * .015,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                
                  Text(': الموقع' ,
 
                      style: GoogleFonts.elMessiri(
                          fontSize: h * .023,
                          color: const Color.fromARGB(255, 15, 9, 19))),
                          
                          Text( model!.locationName ,textAlign:TextAlign.end ,),
                ],
              ),
              SizedBox(
                height: h * .015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ Text(// textDirection: TextDirection.rtl,
                  DateFormat('HH:mm a').format(model!.createdAt),),
                  Text(': الوقت',
                      // textDirection: TextDirection.rtl,
                      style: GoogleFonts.elMessiri(
                          fontSize: h * .023,
                          color: const Color.fromARGB(255, 15, 9, 19))),
                         
                ],
              ),
              // Container(
              //     width: double.infinity,
              //     child: Text(
              //    ' timeNote!',
              //      // textDirection: TextDirection.ltr,
              //       style: GoogleFonts.elMessiri(
              //           fontSize: h * .020,
              //           color: Color.fromARGB(255, 99, 99, 100)),
              //     ))
 

 
 
  


 


            ],
          ),
        ),
        SizedBox(
          height: h * .02,
        )
      ],
    );
  }
}

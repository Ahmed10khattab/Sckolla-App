// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:schkolla/table/model/modelTable.dart';

class ContainerForTable extends StatefulWidget {
  ContainerForTable({super.key, 
    // @required this.subject,
    // @required this.time,
   @required this.model,
   // @required this.list
  });
 ModelForTable ?model;
  // String? subject;
  // String? time;
 // List ? list;
  @override
  State<ContainerForTable> createState() => _ContainerForTableState();
}

class _ContainerForTableState extends State<ContainerForTable> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * .05, vertical: h * .02),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: h * .01,
                  color: Color.fromARGB(255, 151, 147, 147))
            ],
            color:Color.fromARGB(255, 236, 235, 235),
            borderRadius: BorderRadius.circular(h * .02)),
        //color: Colors.amber,
        width: double.infinity,
        height: h * 0.12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 7, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(h * .01),
                      topLeft: Radius.circular(h * .01))),
              width: w * .02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Padding(
                //   padding: EdgeInsets.only(top: h * 0.01, right: w * .03),
                //   child: Text(
                //     '1',
                //     style: TextStyle(
                //         fontSize: h * .02, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08,top: h*.02),
                  child: Text(
                  widget.model!.subject!,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.normal,
                      fontSize: h * .025,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08),
                  child: Text(
                 widget.model!.time!,
                  //  "${formatDate(widget.model!.startAt,' hh:mm ')+"am"} : ${formatDate(widget.model!.endAt,' hh:mm ')+"am" } " ,
                     style: GoogleFonts.elMessiri(
                      fontSize: h * .02,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

// String formatteDate(timeStamps){
//   var dateFromTimeStamp=DateTime.fromMillisecondsSinceEpoch(timeStamps*1000 );
//   return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);
// }

 

String formatDate(DateTime date, String format) {
  return DateFormat(format).format(date);
}


}

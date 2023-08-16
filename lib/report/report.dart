 
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:schkolla/drawer/drawer.dart';
//  import 'package:schkolla/report/cutom%20container.dart';

// class Report extends StatefulWidget {
//   const Report({super.key});

//   @override
//   State<Report> createState() => _HomeworKState();
// }

// class _HomeworKState extends State<Report> {
//    String SelectedMonth='يناير';
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
   
//     return Scaffold(
//         drawer:Drawer(
//         child:CostomDrawer(
//           top: h * .48,
//                     left: w * .12, 
//         ) ,
//         width:w*.21 ,backgroundColor: Color.fromARGB(255, 200, 206, 211),) ,
//       appBar: AppBar(leading: Builder(builder: ((context) {
//             return GestureDetector(
//                 onTap: (() {
//                   Scaffold.of(context).openDrawer();
//                 }),
//                 child: Padding(
//                   padding:  EdgeInsets.only(left:w*0.03),
//                   child: const Image(
//                       image: AssetImage('lib/home/home Image/Drawer.png')),
//                 ));
//           })),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(h * .035),
//           bottomRight: Radius.circular(h * .035),
//         )),
//         toolbarHeight: h * .1,
//         backgroundColor: const Color.fromARGB(255, 121, 59, 172),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             // color: Colors.amber,

//             // ignore: sort_child_properties_last
//             child: Padding(
//               padding: EdgeInsets.only(top: h * .03, right: w * .03),
//               child: Text(
//                 "التقارير  الشهرية",
//                 textAlign: TextAlign.right,
//                 style: GoogleFonts.elMessiri(
//                     fontSize: h * .033,
//                     color: const Color.fromARGB(255, 140, 30, 204)),
//               ),
//             ),

//             height: h * .08, width: double.infinity,
//           ),
//           SizedBox(
//             height: h * .01,
//           ),
//           Container(
//             height: h * .1,
            
//             width: double.infinity,
//             child: Padding(
//               padding: EdgeInsets.only(right: w * .04),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   DropdownButton(
                    
//                     menuMaxHeight: h * .3,
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(187, 48, 37, 37),
//                         fontSize: w * .04),
//                     iconSize: w * .088,
//                     items: [
//                       "يناير",
//                       "فبراير",
//                       "مارس",
//                       "ابريل",
//                       " مايو",
//                       "يونيو",
//                       "يوليو",
//                       "اغسطس",
//                       "سبتمبر ",
//                       "اكتوبر",
//                       "نوفمبر",
//                       "ديسمبر"
//                     ]
//                         .map((e) => DropdownMenuItem(
//                               child: Text("$e"),
//                               value: e,
//                             ))
//                         .toList(),
//                     onChanged: (val) {
//                       setState(() {
//                         SelectedMonth = val.toString();
//                       });
//                     },
                    
//                     value: SelectedMonth,
//                   ),
//                   Text(
//                     "الشهر",
//                     textDirection: TextDirection.rtl,
//                     style: GoogleFonts.elMessiri(
//                         fontSize: h * .025,
//                         color: Color.fromARGB(255, 76, 71, 78)),
//                   ),
                  
                                    
//                 ],
//               ),
//             ),
//           ),
//  Container(height:h*.67 ,width: double.infinity,
//  child:ListView(children: [
//   ContainerForReport(reportname: 'تقارير السلوك '),
//   ContainerForReport(reportname: 'تقارير  الغياب '),ContainerForReport(reportname: 'تقارير الدرجات '),
//   ContainerForReport(reportname: 'تقارير السلوك '),
//   ContainerForReport(reportname: 'تقارير السلوك ')
//  ],) ,
//  )
//         ],
//       ),
//     );
//   }
// }



//  import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class MyDatePickerWidget extends StatelessWidget {
//   final List<String> days;

//   MyDatePickerWidget({required this.days});

//   @override
//   Widget build(BuildContext context) {
//     return SfDateRangePicker(
//       view: DateRangePickerView.month,
//       selectionMode: DateRangePickerSelectionMode.range,
//       monthViewSettings: DateRangePickerMonthViewSettings(showTrailingAndLeadingDates: false),
//       initialSelectedDate: DateTime.now(),
//       selectableDayPredicate: (DateTime date) {
//         // Return true to enable selection for the specified date
//         String formattedDate =
//             '${DateFormat('EEE, MMM d, yyyy, h:mm:ss a').format(date)} ${DateTime.now().timeZoneName}';
//         return days.contains(formattedDate);
//       },
//       selectionColor: Colors.orange, // Define the color for the selected dates
//     );
//   }
// }

// class Report extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     List<String> days = [
//       "Thu, May 11, 2023, 7:03:27 PM UTC"
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: h * .1,
//         title: Text(
//           'ايام الحضور ',
//           style: GoogleFonts.elMessiri(
//             fontSize: h * .027,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 121, 59, 172),
//       ),
//       body: Center(
//         child: MyDatePickerWidget(days: days),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// class MyDatePickerWidget extends StatelessWidget {
//   final List<String> days;

//   MyDatePickerWidget({required this.days});

//   @override
//   Widget build(BuildContext context) {
//     List<PickerDateRange> specialDates = days.map((String dateString) {
//       DateTime date = DateFormat('EEE, MMM d, yyyy, h:mm:ss a').parse(dateString);
//       return PickerDateRange(date, date, isHighlighted: true);
//     }).toList();

//     return SfDateRangePicker(
//       view: DateRangePickerView.month,
//       selectionMode: DateRangePickerSelectionMode.range,
//       monthViewSettings: DateRangePickerMonthViewSettings(showTrailingAndLeadingDates: false),
//       initialSelectedDate: DateTime.now(),
//       selectableDayPredicate: (DateTime date) {
//         // Return true to enable selection for the specified date
//         String formattedDate =
//             '${DateFormat('EEE, MMM d, yyyy, h:mm:ss a').format(date)} ${DateTime.now().timeZoneName}';
//         return days.contains(formattedDate);
//       },
//       selectionColor: Colors.orange, // Define the color for the selected dates
//       specialDates: specialDates, // Specify the special dates
//       specialDatesTextStyle: TextStyle(
//         fontWeight: FontWeight.bold,
//         color: Colors.red,
//       ), // Customize the text style for special dates
//     );
//   }
// }

// class Report extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     List<String> days = [
//       "Thu, May 11, 2023, 7:03:27 PM UTC"
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: h * .1,
//         title: Text(
//           'ايام الحضور ',
//           style: GoogleFonts.elMessiri(
//             fontSize: h * .027,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 121, 59, 172),
//       ),
//       body: Center(
//         child: MyDatePickerWidget(days: days),
//       ),
//     );
//   }
// }


 import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schkolla/report/provider/dateProvider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:http/http.dart' as http;

import 'package:intl/intl.dart';


class Report extends StatefulWidget {
  @override
  State<Report> createState() => _MyAppState();
}

class _MyAppState extends State<Report> {
 
  // List<DateTime> _selectedDates = [
  //   DateTime(2023, 1, 15),
  //   DateTime(2023, 2, 10),
  //   DateTime(2023, 3, 25),
    
  // ];
   




  @override



   


  void initState() {
  //getdata();
      super.initState();
  }
  Widget build(BuildContext context) {
     
       
    

     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
   // print(Provider.of<Pro1>(context ).formattedDates);
    print('vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv');
    
 
   List<String> dateString = ['2023-06-1','2023-06-4','2023-06-2'];
DateFormat dateFormat1 = DateFormat('yyyy-MM-dd');
List<DateTime> listDate=[];
s(){
for(String Date in dateString ){
DateTime dateTime = dateFormat1.parse(Date) ;
listDate.add(dateTime);
 
 }
}
 
  
 var ListdateBeforFormate=Provider.of<Pro1>(context,listen: false).formattedDates;
  

 var formatFunction =Provider.of<Pro1>(context,listen: false).s(ListdateBeforFormate);
 var DateafterFormate=Provider.of<Pro1>(context,listen: false).listDate ;

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(h*.03),bottomRight: Radius.circular(h*.03))),
          centerTitle: true,
          toolbarHeight: h*.09,
          backgroundColor: const Color.fromARGB(255, 121, 59, 172),

          title: Text('ايام  الحضور',style: GoogleFonts.elMessiri(fontSize: h*.037,color:Color.fromARGB(255, 61, 22, 83) ),)),
        body: Center(
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
 selectionMode: DateRangePickerSelectionMode.single ,
   
            // minDate: DateTime(2023),
            // maxDate: DateTime(2050),
            initialSelectedDates:  DateafterFormate,
             cellBuilder: (BuildContext context, DateRangePickerCellDetails cellDetails) {
              
              bool isSelectedDate = DateafterFormate . contains(cellDetails.date);
              Color textColor = isSelectedDate ? Colors.white : Colors.black;
              Color backgroundColor = isSelectedDate ? Color.fromARGB(255, 51, 146, 51) : Colors.transparent;
              return Container(
                 
                decoration: BoxDecoration(color: backgroundColor,borderRadius:BorderRadius.circular(h* .03) ),
                
                child: Center(
                  child: Text(
                    cellDetails.date.day.toString(),
                    style: TextStyle(color: textColor),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
//   String convertDateFormat(String originalDate) {
//   // Define the input format
//   DateFormat originalFormat = DateFormat("E, MMM d, y, h:mm:ss a 'UTC'");

//   // Parse the original date string
//   DateTime dateTime = originalFormat.parseUTC(originalDate);

//   // Define the output format
//   DateFormat outputFormat = DateFormat("yyyy-MM-dd");

//   // Format the date using the output format
//   String formattedDate = outputFormat.format(dateTime);
//   print(formattedDate); 

//   return formattedDate;
// }

}


 






 
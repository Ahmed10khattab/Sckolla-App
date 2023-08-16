 

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:schkolla/drawer/drawer.dart';
import 'package:schkolla/notification/cutsom%20container.dart';
import 'package:http/http.dart' as http;
import 'package:schkolla/notification/model/model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class notification extends StatefulWidget {
  const notification({super.key});

  @override
  
  State<notification> createState() => _notificationState();
  
}

class _notificationState extends State<notification> {
   ScrollController scrollController = ScrollController();
  bool loadmore = false;
  List Data = [];
  int page = 1;
  int limit = 20;

  Future<void> getdata() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
   var id= pref.getString('Id');

      final url = Uri.parse('https://joker.animeraa.com/securityMob/getStudentNotificationsById');
      final headers = {'Content-Type': 'application/json'};
       final body = jsonEncode({ "studentId":id });

      try {
        final response = await http.post(url, 
        headers: headers, body: body);
        var body1 = jsonDecode(response.body);
        print(body1);
      //  setState(() {
       //  Data.addAll(body1);
      // });
      print('/////////////////////////////////////////');
print(body1);
print('////////////////');
        return body1;

        // print(response.statusCode);
       // print(response.body);
      } catch (error) {
        print('Error: $error');
      }
    }
  
  @override
  void initState() {
// getdata();
//     scrollController.addListener(() async {
//       if (loadmore) return;
//       if (scrollController.position.pixels ==
//           scrollController.position.maxScrollExtent) {
//         setState(() {
//           loadmore = true;
//         });
//         page = page +1;
//         await getdata();
//         setState(() {
//           loadmore = false;
//         });
//       }
//     });     
    super.initState();
  }
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    

  String formatDate(DateTime date, String format) {
  return DateFormat(format).format(date);
}




    return  Scaffold(
     drawer:Drawer(
        child:CostomDrawer(top: h * .28,
                    left: w * .12, ) ,
        width:w*.21 ,backgroundColor: Color.fromARGB(255, 200, 206, 211),) ,
      appBar:AppBar(
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomLeft: Radius.circular(h*.03),bottomRight:  Radius.circular(h*.03)) ),
        leading: Builder(builder: ((context) {
            return GestureDetector(
                onTap: (() {
                  Scaffold.of(context).openDrawer();
                }),
                child: Padding(
                  padding:  EdgeInsets.only(left:w*0.03),
                  child: const Image(
                      image: AssetImage('lib/home/home Image/Drawer.png')),
                ));
          })),
        backgroundColor:  const Color.fromARGB(255, 121, 59, 172),
      ) ,
      body:ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top:h*.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(alignment: Alignment.topRight,child:Padding(
                  padding:  EdgeInsets.only(right:w*.03),
                  child: Text('اشعارات التنقل',style:GoogleFonts.elMessiri(fontSize: h*.033,color:Color.fromARGB(255, 140, 30, 204) ), ),
                ),width: double.infinity,),
              ],
            ),
          ),SizedBox(height: h*.03,),
           Container(height: h*.783,//color: Colors.amber,
           child:FutureBuilder(future: getdata(),
    builder:(BuildContext,AsyncSnapshot snapshot){
    if (snapshot.hasData){

     print(snapshot.data.length);
      return ListView.builder(
        controller: scrollController,
        itemCount:snapshot.data.length, //loadmore ? Data.length + 1 :Data.length,
        itemBuilder:(BuildContext,i){
         
        // ModelForNotif data =ModelForNotif.fromJson(snapshot.data[i]);
        // DateFormat('yyyy-MM-dd').format(data.createdAt);
 
   return ContainerForNotification(model:ModelForNotif.fromJson(snapshot.data[i]) ,);
      }
      );

    }
      if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(child: Text('خطأ في الشبكة',style: TextStyle(fontSize:h*.02 ),));
   }
    ),
           ),
          // ContainerForNotification(Date: 'اليوم',locaton:'---------' ,notation: ' خرج سليم من المدرسة',time: '---------',timeNote: '1:30Am',),
          // ContainerForNotification(Date: '13 مارس',locaton:'---------' ,notation: '-------',time: '-------',timeNote: '2:22Pm',),  ContainerForNotification(Date: 'اليوم',locaton:'---------' ,notation: ' خرج سليم من المدرسة',time: '---------',timeNote: '1:30Am',),
          // ContainerForNotification(Date: '13 مارس',locaton:'---------' ,notation: '-------',time: '-------',timeNote: '2:22Pm',)
        ],
      ) ,
    );
  }
}




























 

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:schkolla/drawer/drawer.dart';
// import 'package:schkolla/notification/cutsom%20container.dart';
// import 'package:http/http.dart' as http;
// import 'package:schkolla/notification/model/model.dart';
// import 'package:schkolla/report/provider/dateProvider.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class notification extends StatefulWidget {
//   const notification({super.key});

//   @override
  
//   State<notification> createState() => _notificationState();
  
// }

// class _notificationState extends State<notification> {
//    ScrollController scrollController = ScrollController();
//  // bool loadmore = false;
//   List Data = [];
//   int page = 1;
//   //int limit = 20;

//    getdata() async {
     
//     SharedPreferences pref=await SharedPreferences.getInstance();
//    var id= pref.getString('Id');

//       final url = Uri.parse('https://joker.animeraa.com/securityMob/getStudentNotificationsById');
//       final headers = {'Content-Type': 'application/json'};
//        final body = jsonEncode({"page":page , "studentId":id });

//       try {
//         final response = await http.post(url, 
//         headers: headers, body: body);
//         var body1 = jsonDecode(response.body)  ;
//        // setState(() {
//          Data.addAll(body1);
        
          
//       // });
//    //   print('///////////////////////////////////////////');
// print(body1);
// //print('////////////////');
//         return body1;

//         // print(response.statusCode);
//        // print(response.body);
//       } catch (error) {
//         print('Error: $error');
//       }
//     }
//     // sco(){
//     //   scrollController.addListener(() async{ 
//     //     if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
//     //       page=page+1;
//     //        await getdata();
//     //     }
//     //   });
//     // }
  
//   @override
//   void initState() {
//  getdata();
//    scrollController.addListener(()async { 
//         if(scrollController.position.pixels==scrollController.position.maxScrollExtent){
//           page=page+1;
//           await  getdata();
//         }
//       });
//     // scrollController.addListener(() async {
       
//     //   if (scrollController.position.pixels ==
//     //       scrollController.position.maxScrollExtent) {
//     //     setState(() {
//     //       loadmore = true;
//     //     });
//     //     page = page +1;
//     //     await getdata();
//     //     setState(() {
//     //       loadmore = false;
//     //     });
//     //   }
//     // });     
//     super.initState();
//   }
//   @override
//   void dispose() {
//     scrollController.dispose();
//     super.dispose();
//   }
//   Widget build(BuildContext context) {
//      var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
    

//   String formatDate(DateTime date, String format) {
//   return DateFormat(format).format(date);
// }




//     return  Scaffold(
//      drawer:Drawer(
//         child:CostomDrawer(top: h * .28,
//                     left: w * .12, ) ,
//         width:w*.21 ,backgroundColor: Color.fromARGB(255, 200, 206, 211),) ,
//       appBar:AppBar(
//         shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(bottomLeft: Radius.circular(h*.03),bottomRight:  Radius.circular(h*.03)) ),
//         leading: Builder(builder: ((context) {
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
//         backgroundColor:  const Color.fromARGB(255, 121, 59, 172),
//       ) ,
//       body:ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top:h*.03),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Container(alignment: Alignment.topRight,child:Padding(
//                   padding:  EdgeInsets.only(right:w*.03),
//                   child: Text('اشعارات التنقل',style:GoogleFonts.elMessiri(fontSize: h*.033,color:Color.fromARGB(255, 140, 30, 204) ), ),
//                 ),width: double.infinity,),
//               ],
//             ),
//           ),SizedBox(height: h*.03,),
//            Container(height: h*.783,//color: Colors.amber,
//            child:FutureBuilder(future: getdata(),
//     builder:(BuildContext,AsyncSnapshot snapshot){
//     if (snapshot.hasData){
//       print('////////////////////////');
//  print(Data.length);
//        print('////////////////////////////');


//    //  print(snapshot.data.length);
//       return ListView.builder(
//         controller: scrollController,
//         itemCount:Data.length, //snapshot.data.length ,
//         // loadmore ? Data.length + 1 :Data.length,
//         itemBuilder:(BuildContext,i){
         
//         // ModelForNotif data =ModelForNotif.fromJson(snapshot.data[i]);
//         // DateFormat('yyyy-MM-dd').format(data.createdAt);
 
//    return Text('data');//ContainerForNotification(model:ModelForNotif.fromJson(snapshot.data[i]) ,);
//       }
//       );

//     }
//       if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             return Center(child: Text('خطأ في الشبكة',style: TextStyle(fontSize:h*.02 ),));
//    }
//     ),
//            ),
//           // ContainerForNotification(Date: 'اليوم',locaton:'---------' ,notation: ' خرج سليم من المدرسة',time: '---------',timeNote: '1:30Am',),
//           // ContainerForNotification(Date: '13 مارس',locaton:'---------' ,notation: '-------',time: '-------',timeNote: '2:22Pm',),  ContainerForNotification(Date: 'اليوم',locaton:'---------' ,notation: ' خرج سليم من المدرسة',time: '---------',timeNote: '1:30Am',),
//           // ContainerForNotification(Date: '13 مارس',locaton:'---------' ,notation: '-------',time: '-------',timeNote: '2:22Pm',)
//         ],
//       ) ,
//     );
//   }
// }



// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class notification extends StatefulWidget {
//   const notification({super.key});

//   @override
//   State<notification> createState() => _notificationState();
// }

// class _notificationState extends State<notification> {
//  ScrollController scrolle=ScrollController();
//  List Data=[];
//  int Page=1;
//  @override
//   void initState() {
//     super.initState();
//     getdata();
//     scrolle.addListener(scroll);

//   }

//   @override
//   Widget build(BuildContext context) {
//     return   Scaffold(

// body:FutureBuilder(
// future:getdata() ,
//   builder: (context, snapshot) {
//     return     ListView.builder(
//       controller: scrolle,
//       itemCount:Data.length ,
//       itemBuilder:(context,i){
//         print(Data.length);
// return Text('data') ;
//     } );
//   }
// ) ,
//     );
//   }
//   getdata()async{
    
//       final headers = {'Content-Type': 'application/json'};
//         final body = jsonEncode({ "studentId":'6450226f8bac550a5cf81fb9' });
// final uri=Uri.parse('https://joker.animeraa.com/securityMob/getStudentNotificationsById');
// //print(uri);
// final respose=await http.post(uri,body: body,headers: headers);
// final body1=jsonDecode(respose.body)  ;
// setState(() {
//   Data.addAll(body1);
// });
// //print(Data.length);

//   }

//   scroll() async{
//     if(scrolle.position.pixels==scrolle.position.maxScrollExtent){
//       Page=Page+1;
//       await getdata();
     
//     }
    
//   }
// }
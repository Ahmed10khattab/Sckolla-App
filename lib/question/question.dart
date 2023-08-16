import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:schkolla/drawer/drawer.dart';
 import 'package:http/http.dart' as http;
 import 'package:shared_preferences/shared_preferences.dart';
 
class Qestion extends StatefulWidget {
  const Qestion({super.key});

  @override
  State<Qestion> createState() => _ChatTeacherState();
}

class _ChatTeacherState extends State<Qestion> {
  GlobalKey<FormState> key1 = GlobalKey<FormState>();

  TextEditingController msg = TextEditingController();
  ScrollController scrollController = ScrollController();
  bool loadmore = false;
  List Data = [];
  int page = 1;
  //int limit = 20;
  @override

SendMsg() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var StudentId = prefs.getString('Id');
      print(StudentId);

      final url =
          Uri.parse('https://joker.animeraa.com/studentMob/createNewMsg');
      final headers = {'Content-Type': 'application/json'};

      final body = jsonEncode({"studentId": StudentId, "msg": msg.text});
      final response = await http.post(url, headers: headers, body: body);
      var body1 = jsonDecode(response.body);

      print(body1);
    }

   Stream getdata() async*{

      SharedPreferences prefs=await SharedPreferences.getInstance();
         var StudentId = prefs.getString('Id');
      
       
   var url=  Uri.parse( 'https://joker.animeraa.com/studentMob/getAllMsgsByStudentId/$StudentId');
     
  
      print(  prefs.getString('classId'));
 



  var res=await http.get(url);
  var body=jsonDecode(res.body);
  yield body;
  print(body);
   

}


  
    
  void initState() {
    msg = TextEditingController();
    getdata();

    // scrollController.addListener(() {
      
    //   if (scrollController.position.pixels ==scrollController.position.maxScrollExtent){
    //     print('lllllllllllllllllllllllllll');
       
    //          page=page+1;
    //     getChat();
        
     
      
    //      {
    //   //   setState(() {
    //   //     loadmore = true;
    //   //   });
    //   //   skip = skip + 1;
    //   //   await getChat();
    //   //   setState(() {
    //   //     loadmore = false;
    //   //   });
    //    }
    // }});
    super.initState();
  }

  @override
  void dispose() {
    msg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    validation() {
      var value = key1.currentState;
      if (value!.validate()) {
        value.save();
      }
    }

    

     return Scaffold(
      drawer:Drawer(
        child:CostomDrawer(top: h * .28,
                    left: w * .12, ) ,
        width:w*.21 ,backgroundColor: Color.fromARGB(255, 200, 206, 211),) ,
      appBar: AppBar(
        leading: Builder(builder: ((context) {
          return GestureDetector(
              onTap: (() {
                Scaffold.of(context).openDrawer();
              }),
              child: Padding(
                padding: EdgeInsets.only(left: w * 0.03),
                child: const Image(
                    image: AssetImage('lib/home/home Image/Drawer.png')),
              ));
        })),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(h * .02),
              bottomRight: Radius.circular(h * .02)),
        ),
        backgroundColor: Color.fromARGB(255, 140, 30, 204),
        toolbarHeight: h * .1,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: h * .1,
            //    color: Colors.deepOrange,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'الاستفسار والشكاوي',
                    // textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.elMessiri(
                        fontSize: h * .027,
                        color: Color.fromARGB(255, 140, 30, 204)),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: h * .001,
            thickness: w * .003,
            endIndent: w * 0.04,
            indent: w * 0.04,
          ),
          SizedBox(height: h*.002,),
          Column(
            children: [
              Container(
                height: h * .68,
                child: StreamBuilder(
                    stream:getdata(),
                    builder: (context, snapshot) {
                      print(snapshot.data);

                      var m=snapshot.data;

                       
                      // print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
                      if (snapshot.hasData) {
                        //   print(snapshot.data);
                        return ListView.builder(
                          controller: scrollController,
                            reverse: true,
                            shrinkWrap: true,
                            itemCount:snapshot.data.length,  
                            itemBuilder: (context, i) {
                              // DateTime dateTime =
                              //     DateTime.parse(m[i]['createdAt']);

                              // String formattedTime =
                              //     DateFormat('HH:mm').format(dateTime);
                              //return Text(messages[i]['msg']);
  
  
                              return Padding(
                                padding: m[i]['isAdmin']
                                    ? EdgeInsets.only(
                                        top: h * .02,
                                        bottom: h * .005,
                                        right: w * .3,
                                        left: w * .024):
                                    
                                    EdgeInsets.only(
                                        top: h * .02,
                                        bottom: h * .005,
                                        left: w * .3,
                                        right: w * .024),
                                    
                                child: Column(
                                  crossAxisAlignment: m[i]['isAdmin']
                                      ? CrossAxisAlignment.start: CrossAxisAlignment.end,
                                      
                                  children: [
                                    GestureDetector(
                                      onTapUp: (details) {
                                        var dx = details.globalPosition.dx;
                                        double dy = details.globalPosition.dy;
                                        double dx2 =
                                            MediaQuery.of(context).size.width -
                                                dx;
                                        double dy2 =
                                            MediaQuery.of(context).size.height -
                                                dy;
                                        showMenu(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                                dx, dy, dx2, dy2),
                                            items: [
                                              PopupMenuItem(
                                                  onTap: () {},
                                                  child: const Text('delete'))
                                            ]);
                                      },
                                      child: Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.only(
                                            topRight: m[i]['isAdmin']
                                                ?Radius.circular(w * .05): const Radius.circular(0),
                                                
                                            topLeft: m[i]['isAdmin']
                                                ?const Radius.circular(0): Radius.circular(w * .05),
                                                 
                                            bottomRight:
                                                Radius.circular(w * .05),
                                            bottomLeft:
                                                Radius.circular(w * .05)),
                                        color: m[i]['isAdmin']
                                            ? Color.fromARGB(
                                                255, 202, 216, 216) :Color.fromARGB(255, 145, 114, 255),
                                          
                                        child: Padding(
                                          padding: m[i]['isAdmin']
                                              ?EdgeInsets.only(
                                                  right: w * .04,
                                                  left: w * .05,
                                                  bottom: h * .01,
                                                  top: h * .01) :EdgeInsets.only(
                                                  left: w * .03,
                                                  right: w * .05,
                                                  bottom: h * .01,
                                                  top: h * .01),
                                            
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                m[i]['msg'],
                                                style: TextStyle(
                                                    fontSize: w * .044),
                                                textAlign: TextAlign.end,
                                              ),
                                              // Text(formattedTime,
                                              //     style: TextStyle(
                                              //         fontSize: w * .033))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            
                           

                              //Text (messages[i]['msg']);
                            }
                            );
                      }
 else if(snapshot.connectionState==ConnectionState.waiting){
                              return Center(child:CircularProgressIndicator() ,);
                            }


                      return Center(child: Text('خطأ في الشبكة',style: TextStyle(fontSize:h*.02 ),),);
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(left: w * .04,right: w * .04,bottom: w * .01,),
                child: Container(
                  // color: Colors.green,
                  height: h * .08,
                  width: double.infinity,
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('ادخل رسالة');
                        }
                        return null;
                      },
                      controller: msg,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                            onTap: () async {
                              if (msg.text.isNotEmpty) {
                                await SendMsg();

                                msg.clear();
                                setState(() {});
                              }
                            },
                            child: Icon(
                              Icons.send_sharp,
                              size: h * .04,
                              color: Color.fromARGB(255, 102, 25, 153),
                            )),
                        hintText: 'اكتب رسالة......',
                         hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(fontSize: w * .04),
                        // suffixText:'اسم المستخدم' ,
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * .07)),
                            borderSide: const BorderSide(color: Colors.black)),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * .07)),
                            borderSide: const BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * .07))),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * .07))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(w * .07))),
                      )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Qestion extends StatefulWidget {
//   const Qestion({super.key});

//   @override
//   State<Qestion> createState() => _QestionState();
// }

// class _QestionState extends State<Qestion> {
  
//   TextEditingController msg = TextEditingController();
  
//   @override void setState(VoidCallback fn) {
//     // TODO: implement setState
//     super.setState(fn);
//   }
//   @override
//   void initState() {
      
      
//     super.initState();
//   }
//   Widget build(BuildContext context) {
    
//     // SendMsg() async {
//     //   SharedPreferences prefs = await SharedPreferences.getInstance();
//     //   var StudentId = prefs.getString('Id');
//     //   print(StudentId);

//     //   final url =
//     //       Uri.parse('https://joker.animeraa.com/studentMob/createNewMsg');
//     //   final headers = {'Content-Type': 'application/json'};

//     //   final body = jsonEncode({"studentId": StudentId, "msg": msg.text});
//     //   final response = await http.post(url, headers: headers, body: body);
//     //   var body1 = jsonDecode(response.body);

//     //   print(body1);
//     // }
//  ScrollController scrollController = ScrollController();
//   bool loadmore = false;
//   List Data = [];
//   int page = 1;
  
//     Stream getChat() async* {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var StudentId = prefs.getString('Id');
//       print(StudentId);

//       final url = Uri.parse(
//           'https://joker.animeraa.com//studentMob/getAllMsgsWithPaginationByStudentId');
//       final headers = {'Content-Type': 'application/json'};

//       final body =
//           jsonEncode({"studentId": '6450226f8bac550a5cf81fb9', "page": 1});
//       final response = await http.post(url, headers: headers, body: body);
//       var body1 = jsonDecode(response.body);
//      // print(body1);
//       // Provider.of<Pro1>(context, listen: false).storemsg(body1);
//       //     print(body1["messages"]);
//       //     var messages = body1['messages'];
//       //     for (var message in messages) {
//       // var isAdmin = message['isAdmin']; // Access the 'isAdmin' key within each message object
//       // print('isAdmin: $isAdmin');
//       yield body1;
// //}
//     }
//  double h = MediaQuery.of(context).size.height;
//  double w = MediaQuery.of(context).size.width;
//     return Scaffold(
      
//       body: StreamBuilder(
//           stream: getChat(),
//           builder: (context,  snapshot) {
//             print(snapshot.data['messages']);
//             print('////////////////////////////////////////////////////');

//            var jsonData = snapshot.data;
           
//            //'{"messages":[{ "isAdmin": false,"_id": "64a219862fcda8b66bedcfac","msg": "hole","createdAt": "2023-07-03T00:42:46.403Z"},{ "isAdmin": false,"_id": "64a219862fcda8b66bedcfac","msg": "hole","createdAt": "2023-07-03T00:42:46.403Z"}],"currentPage":2,"totalPages":1}';
//  // var data = jsonDecode(jsonData);
 
//   var messages =  jsonData['messages'];
  
//   // print(messages);
//   // print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
//             if (snapshot.hasData) {
//            //   print(snapshot.data);
//               return ListView.builder(
//                   itemCount: messages.length ,
//                   itemBuilder: (context, i) {
//                     //return Text(messages[i]['msg']);
//                    return   Padding(
//       padding:messages[i]['isAdmin']     ?  EdgeInsets.only(top:h*.02,bottom: h*.005 ,left:w*.3,right: w*.024 ):EdgeInsets.only(top:h*.02,bottom: h*.005,right:w*.3,left:  w*.024),
//       child: Column(
//         crossAxisAlignment:messages[i]['isAdmin'] 
//             ? CrossAxisAlignment.end
//             : CrossAxisAlignment.start,
//         children: [
           
          
//           GestureDetector(
//             onTapUp: (details) {
//               var dx = details.globalPosition.dx;
//               double dy = details.globalPosition.dy;
//               double dx2 = MediaQuery.of(context).size.width - dx;
//               double dy2 = MediaQuery.of(context).size.height - dy;
//               showMenu(
//                   context: context,
//                   position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
//                   items: [
//                     PopupMenuItem(
//                         onTap: () {
                           
//                         },
//                         child: const Text('delete'))
//                   ]);
//             },
//             child: Material(
//               elevation: 5,
//               borderRadius: BorderRadius.only(
//                   topRight:messages[i]['isAdmin']  
//                       ? const Radius.circular(0)
//                       :  Radius.circular(w*.05),
//                   topLeft:messages[i]['isAdmin']  
//                       ?  Radius.circular(w*.05)
//                       : const Radius.circular(0),
//                   bottomRight:  Radius.circular(w*.05),
//                   bottomLeft:  Radius.circular(w*.05)),
//               color:messages[i]['isAdmin']  
//                   ? Color.fromARGB(255, 145, 114, 255)
//                   :Color.fromARGB(255, 202, 216, 216),
//               child: Padding(
//                 padding:
//                   messages[i]['isAdmin'] ?   EdgeInsets.only( left: w*.03,right: w*.05,bottom: h*.01,top: h*.01):EdgeInsets.only( right: w*.04,left: w*.05,bottom: h*.01,top: h*.01),
//                 child: Column(
                  
//  crossAxisAlignment:  CrossAxisAlignment.start,
//                   children: [
                    
//                     Text(
                      
//                      messages[i]['msg'] ,
//                       style:   TextStyle(fontSize:w*.044 ),textAlign: TextAlign.end ,



//                     ),
                     
//                     Text('1:30 Am', style:   TextStyle(fontSize:w*.033 ))
//                   ],
//                 ),
//               ),
//             ),
//           ),
           
//         ],
//       ),
//     );
                    
//                     //Text (messages[i]['msg']);
//                   });
//             }
//             return Text('error');
//           }),
//     );
//   }
// }





//import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
//  import 'package:shared_preferences/shared_preferences.dart';

// class Qestion extends StatefulWidget {
//   const Qestion({super.key});

//   @override
//   State<Qestion> createState() => _QestionState();
// }

// class _QestionState extends State<Qestion> {
//   ScrollController scrollController = ScrollController();
//   TextEditingController msg = TextEditingController();

//   bool loadmore = false;
//    List Data = [];
//   int page = 1;
//   int limit = 20;
//    SendMsg() async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var StudentId = prefs.getString('Id');
//       print(StudentId);

//       final url =
//           Uri.parse('https://joker.animeraa.com/studentMob/createNewMsg');
//       final headers = {'Content-Type': 'application/json'};

//       final body = jsonEncode({"studentId": StudentId, "msg": msg.text});
//       final response = await http.post(url, headers: headers, body: body);
//       var body1 = jsonDecode(response.body);

//       print(body1);
//     }
// Stream firstLoad()async*{
//   try {
//      SharedPreferences prefs = await SharedPreferences.getInstance();
//     var StudentId = prefs.getString('Id');
//     print(StudentId);

//     final url = Uri.parse(
//         'https://joker.animeraa.com//studentMob/getAllMsgsWithPaginationByStudentId');
//     final headers = {'Content-Type': 'application/json'};

//     final body = jsonEncode({"studentId": StudentId, "page":page});
//     final response = await http.post(url, headers: headers, body: body);
//     var body1 = jsonDecode(response.body);
//     var n=body1['messages'];
// yield body1;
//       setState(() {
//         Data=n;
//       });
//       print(Data);

//   }
//   catch(e){
//     print("errrrrror");
//   }
  
    
// }
// //  Stream fethdata() async* {
// //   //Data.clear();
// //  SharedPreferences prefs = await SharedPreferences.getInstance();
// //     var StudentId = prefs.getString('Id');
// //     print(StudentId);

// //     final url = Uri.parse(
// //         'https://joker.animeraa.com//studentMob/getAllMsgsWithPaginationByStudentId');
// //     final headers = {'Content-Type': 'application/json'};

// //     final body = jsonEncode({"studentId": StudentId, "page":page});
// //     final response = await http.post(url, headers: headers, body: body);
// //     var body1 = jsonDecode(response.body);
// //     var d=body1['messages'];
// //       print('///////////////////////////////////');

// //  print(body1);

// //  print('///////////////////////////////////');

// //   print(Data);
// //   print(',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,');
// // //Data.clear();
// //       setState(() {
// //         Data.addAll(d);
// //       });
// //     yield body1;
// //   }
  

//   @override
//   void initState() {
//    firstLoad()  ;
//     scrollController.addListener(() async {
//       if (loadmore) return;
//       if (scrollController.offset ==
//           scrollController.position.maxScrollExtent) {
//         setState(() {
//           loadmore = true;
//         });
//         page = page + 1;
//         await  firstLoad();
//         setState(() {
//           loadmore = false;
//         });
//       }
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//      var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return Scaffold(
//         appBar: AppBar(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(w*.06))),
//           backgroundColor:Color.fromARGB(255, 163, 29, 180) ,
//           toolbarHeight: h*.1,
//           title: const Text('pagination'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height:h*.7 ,
//               color: Colors.blue,
//               child: StreamBuilder(
//                 stream: firstLoad() ,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData){
//                       return ListView.builder(

                    
//                    // shrinkWrap: true,
//                      controller: scrollController,
//                       itemCount:
//                       //Data.length ,
                      
//                      loadmore ? Data.length + 1 :Data.length,
//                       itemBuilder: ((context, index) {
//                         if (index >= Data.length) {
//                           return const Center(
//                             child: CircularProgressIndicator(),
//                           );
//                         } else {
//                           return Card(
//                             child: ListTile(
//                               title: Text('${Data[index]['msg']}'),
//                               subtitle: Text('${Data[index]['description']}'),
//                             ),
//                           );
//                         }
//                       }));

//                   }
//                   else if(snapshot.connectionState==ConnectionState.waiting){
//                     return Center(child:CircularProgressIndicator(color: Colors.amber,) ,);
//                   }
//                 return Center(child: Text('error network')) ;
//                 }
//               ),
//             ),
//                     Padding(
//                 padding: EdgeInsets.symmetric(horizontal: w * .04),
                // child: Container(
                //   // color: Colors.green,
                //   height: h * .08,
                //   width: double.infinity,
                //   child: TextFormField(
                //       validator: (value) {
                //         if (value!.isEmpty) {
                //           return ('ادخل رسالة');
                //         }
                //         return null;
                //       },
                //       controller: msg,
                //       keyboardType: TextInputType.text,
                //       decoration: InputDecoration(
                //         suffixIcon: GestureDetector(
                //             onTap: () async {
                //               if (msg.text.isNotEmpty) {
                //                 await SendMsg();

                //                 msg.clear();
                //                 setState(() {});
                //               }
                //             },
                //             child: Icon(
                //               Icons.send_sharp,
                //               size: h * .04,
                //               color: Color.fromARGB(255, 102, 25, 153),
                //             )),
                //         hintText: 'اكتب رسالة......',
                //         // hintTextDirection: TextDirection.rtl,
                //         hintStyle: TextStyle(fontSize: w * .04),
                //         // suffixText:'اسم المستخدم' ,
                //         disabledBorder: OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(w * .07)),
                //             borderSide: const BorderSide(color: Colors.black)),
                //         errorBorder: OutlineInputBorder(
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(w * .07)),
                //             borderSide: const BorderSide(color: Colors.black)),
                //         focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 const BorderSide(color: Colors.blueAccent),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(w * .07))),
                //         focusedErrorBorder: OutlineInputBorder(
                //             borderSide: const BorderSide(color: Colors.black),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(w * .07))),
                //         enabledBorder: OutlineInputBorder(
                //             borderSide: const BorderSide(color: Colors.black),
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(w * .07))),
                //       )),
                // ),
//               ),
//           ],
//         ));
//   }
// // }
































// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
 
// class Qestion extends StatefulWidget {
//   const Qestion({super.key});

//   @override
//   State<Qestion> createState() => _QestionState();
// }

// class _QestionState extends State<Qestion> {
//   ScrollController scrollController =ScrollController();
//         TextEditingController msg = TextEditingController();

//   bool loadmore = false;
//   @override
//   void setState(VoidCallback fn) {
//      List Data = [];
//      super.setState(fn);
//   }
//   List Data = [];
//   // int skip = 0;
//   // int limit = 20;
//   var page=1;

//      SendMsg() async {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       var StudentId = prefs.getString('Id');
//       print(StudentId);

//       final url =
//           Uri.parse('https://joker.animeraa.com/studentMob/createNewMsg');
//       final headers = {'Content-Type': 'application/json'};

//       final body = jsonEncode({"studentId": StudentId, "msg": msg.text});
//       final response = await http.post(url, headers: headers, body: body);
//       var body1 = jsonDecode(response.body);

//       print(body1);
//       return body1;
//     }

//   Stream fethdata() async* {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//     var StudentId = prefs.getString('Id');
//     print(StudentId);

//     final url = Uri.parse(
//         'https://joker.animeraa.com//studentMob/getAllMsgsWithPaginationByStudentId');
//     final headers = {'Content-Type': 'application/json'};

//     final body = jsonEncode({"studentId": StudentId, "page":page});
//     final response = await http.post(url, headers: headers, body: body);
//     var body1 = jsonDecode(response.body);
//     var d=body1['messages'];
//     yield body1;
//    var m= Provider.of<Pro1>(context,listen: false).list;
//     print('/////////////////');

//  print(m);
//  print('/bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb');

// // var A=Provider.of<Pro1>(context,listen: false).list;


       
//            Provider.of<Pro1>(context,listen: false).storebody(d); 

//       //    Data.addAll(d);
//          page=page+1;
        
       
       
//     }
  
//   @override
//   void initState() {
//     fethdata();
//     scrollController=ScrollController();
     
    
//   //   
//     scrollController.addListener(() async {
//       if (loadmore) return;
//       if (scrollController!.position.pixels ==
//           scrollController!.position.maxScrollExtent) {
//         // setState(() {
//         //   loadmore = true;
//         // });
// //page=page+1;
//           fethdata();
//         // setState(() {
//         //   //loadmore = false;
//         //  });
//       }
//     });
//     super.initState();
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//      var w = MediaQuery.of(context).size.width;
//      var list=Provider.of<Pro1>(context,listen: false).list; 

//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('pagination'),
//         ),
//         body: Form(
//           child: Column(
//             children: [
//               Container(
//                 height: h*.8,
//                 color: const Color.fromARGB(255, 156, 163, 168),
//                 child: StreamBuilder(
//                   stream: fethdata(),
//                   builder: (context, snapshot) {
//                     var b=snapshot.data['messages'];
//                     print('//////////////////////////////////');
//                     print(b);
//                     print('///////////////////');
//                     return ListView.builder(
//                       controller: scrollController,
//                       // shrinkWrap: true,
//                        // controller: scrollController,
//                         itemCount:list.length ,
                        
//                     //    loadmore ?snapshot.data['messages'].length + 1 :snapshot.data['messages'].length,
//                         itemBuilder: ((context, index) {
//                           if (index >=list.length ) {
//                             return const Center(
//                               child: CircularProgressIndicator(),
//                             );
//                           } else {
//                             return  Padding(
//               padding:list[index]['isAdmin']     ?  EdgeInsets.only(top:h*.02,bottom: h*.005 ,left:w*.3,right: w*.024 ):EdgeInsets.only(top:h*.02,bottom: h*.005,right:w*.3,left:  w*.024),
//               child: Column(
//           crossAxisAlignment: list[index]['isAdmin']  
//               ? CrossAxisAlignment.end
//               : CrossAxisAlignment.start,
//           children: [
             
            
//             GestureDetector(
//               onTapUp: (details) {
//                 var dx = details.globalPosition.dx;
//                 double dy = details.globalPosition.dy;
//                 double dx2 = MediaQuery.of(context).size.width - dx;
//                 double dy2 = MediaQuery.of(context).size.height - dy;
//                 showMenu(
//                     context: context,
//                     position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
//                     items: [
//                       PopupMenuItem(
//                           onTap: () {
                             
//                           },
//                           child: const Text('delete'))
//                     ]);
//               },
//               child: Material(
//                 elevation: 5,
//                 borderRadius: BorderRadius.only(
//                     topRight:list[index]['isAdmin'] 
//                         ? const Radius.circular(0)
//                         :  Radius.circular(w*.05),
//                     topLeft:list[index]['isAdmin']  
//                         ?  Radius.circular(w*.05)
//                         : const Radius.circular(0),
//                     bottomRight:  Radius.circular(w*.05),
//                     bottomLeft:  Radius.circular(w*.05)),
//                 color:list[index]['isAdmin'] 
//                     ? Color.fromARGB(255, 145, 114, 255)
//                     :Color.fromARGB(255, 202, 216, 216),
//                 child: Padding(
//                   padding:
//                      list[index]['isAdmin'] ?   EdgeInsets.only( left: w*.03,right: w*.05,bottom: h*.01,top: h*.01):EdgeInsets.only( right: w*.04,left: w*.05,bottom: h*.01,top: h*.01),
//                   child: Column(
//          crossAxisAlignment:  CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         list[index]['msg']  ,
//                         style:   TextStyle(fontSize:w*.044 ),textAlign: TextAlign.end ,
        
        
        
//                       ),
                       
//                       Text('1:30 Am', style:   TextStyle(fontSize:w*.033 ))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
             
//           ],
//               ),
//             );
//                           }
//                         }));
//                   }
//                 ),
//               ),
//                  Container(
//                     // color: Colors.green,
//                     height: h * .08,
//                     width: double.infinity,
//                     child: TextFormField(
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return ('ادخل رسالة');
//                           }
//                           return null;
//                         },
//                         controller: msg,
//                         keyboardType: TextInputType.text,
//                         decoration: InputDecoration(
//                           suffixIcon: GestureDetector(
//                               onTap: () async {
//                                 if (msg.text.isNotEmpty) {
//                                   await SendMsg();
//         setState(() {Data.add(msg.text);});
//                                   msg.clear();
                                   
//                                 }
//                               },
//                               child: Icon(
//                                 Icons.send_sharp,
//                                 size: h * .04,
//                                 color: Color.fromARGB(255, 102, 25, 153),
//                               )),
//                           hintText: 'اكتب رسالة......',
//                           // hintTextDirection: TextDirection.rtl,
//                           hintStyle: TextStyle(fontSize: w * .04),
//                           // suffixText:'اسم المستخدم' ,
//                           disabledBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(w * .07)),
//                               borderSide: const BorderSide(color: Colors.black)),
//                           errorBorder: OutlineInputBorder(
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(w * .07)),
//                               borderSide: const BorderSide(color: Colors.black)),
//                           focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   const BorderSide(color: Colors.blueAccent),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(w * .07))),
//                           focusedErrorBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(w * .07))),
//                           enabledBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(color: Colors.black),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(w * .07))),
//                         )),
//                   ),
//             ],
//           ),
//         ));
//   }
// }


 
 
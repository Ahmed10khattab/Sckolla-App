import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schkolla/drawer/drawer.dart';
import 'package:schkolla/teacher/customContainerForcChat.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatTeacher extends StatefulWidget {
  ChatTeacher({super.key, this.techername, this.teacherId});
  String? techername;
  String? teacherId;
  @override
  State<ChatTeacher> createState() => _ChatTeacherState();
}

class _ChatTeacherState extends State<ChatTeacher> {
  IO.Socket? socket;
  List msgs = [];

  SendMsg() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var StudentId = prefs.getString('Id');

    print(StudentId);

    final url = Uri.parse('https://joker.animeraa.com/studentMob/addNewMsg');
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      "studentId": StudentId,
      "teacherId": widget.teacherId,
      "msg": msg.text
    });
    final response = await http.post(url, headers: headers, body: body);
    var body1 = jsonDecode(response.body);

    print(body1);
    return body1;
  }

  Stream getdata() async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var StudentId = prefs.getString('Id');

    print(StudentId);

    final url = Uri.parse('https://joker.animeraa.com/studentMob/getMsgs');
    final headers = {'Content-Type': 'application/json'};

    final body =
        jsonEncode({"studentId": StudentId, "teacherId": widget.teacherId});
    final response = await http.post(url, headers: headers, body: body);
    var body1 = jsonDecode(response.body);
    // print('///////////////////////////////////////');
    //  print(body1);
    //  print('///////////////////////////////');
    yield body1;
  }

  intiTeSocket() {
    socket = IO.io('https://joker.animeraa.com/', {
      'transports': ['websocket'],
      "autoConnect": false
    });
    socket!.connect();
    socket!.onConnect((data) {
      print('clint is connected with server!');
    });
    socket!.onDisconnect(
      (data) {
        print('clint is disconnected');
      },
    );

    socket!.on('newMsg', ((data) {
      //  setState(() {
      //     msgs.add(data);

      // });
    }));
  }

  @override
  void initState() {
    getdata();
    intiTeSocket();
    super.initState();
  }

  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        child: CostomDrawer(
          top: h * .7,
          left: w * .12,
        ),
        width: w * .21,
        backgroundColor: Color.fromARGB(255, 200, 206, 211),
      ),
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
              bottomLeft: Radius.circular(h * .03),
              bottomRight: Radius.circular(h * .03)),
        ),
        backgroundColor: Color.fromARGB(255, 140, 30, 204),
        toolbarHeight: h * .1,
      ),
      body: ListView(
        shrinkWrap: true,
        // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   width: double.infinity,
          //   height: h*.1,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //           bottomLeft: Radius.circular(h * .02),
          //           bottomRight: Radius.circular(h * .02)),
          //       color:const Color.fromARGB(255, 140, 30, 204)),
          //   // width: double.infinity,
          //   // height: h * .1,
          //   // child: Padding(
          //   //   padding:   EdgeInsets.only(left:w*.04),
          //   //   child: const Image(
          //   //          image: AssetImage('lib/home/home Image/Drawer.png')),
          //  // ),
          // ),

          Container(
            height: h * .1,
            //    color: Colors.deepOrange,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz_sharp),
                      iconSize: h * .044,
                    )),
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.techername!,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.elMessiri(
                        fontSize: h * .027,
                        color: Color.fromARGB(255, 140, 30, 204)),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: h * .07,
                    width: w * .07,
                    child: const Image(
                      image: AssetImage('lib/teacher/teacherImage/mr.png'),
                      fit: BoxFit.contain,
                    ),
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
          // SizedBox(height: h*.002,),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: h * .68,

//color: Colors.amber,
                child: StreamBuilder(
                    stream: getdata(),
                    builder: (context, snapshot) {
                      var m = snapshot.data;
                      //print(m.length);
                      if (snapshot.hasData) {
                        if (snapshot.data.length == 0) {
                          return Center(
                              child: Text('ابدأ المحادثة الان ',
                                  style: GoogleFonts.elMessiri(
                                      fontSize: h * .02)));
                        }
                        return ListView.builder(
                            reverse: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, i) {
                              return Padding(
                                padding: m[i]['isTeacher']
                                    ? EdgeInsets.only(
                                        top: h * .02,
                                        bottom: h * .005,
                                        left: w * .3,
                                        right: w * .024)
                                    : EdgeInsets.only(
                                        top: h * .02,
                                        bottom: h * .005,
                                        right: w * .3,
                                        left: w * .024),
                                child: Column(
                                  crossAxisAlignment: m[i]['isTeacher']
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
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
                                            topRight: m[i]['isTeacher']
                                                ? const Radius.circular(0)
                                                : Radius.circular(w * .05),
                                            topLeft: m[i]['isTeacher']
                                                ? Radius.circular(w * .05)
                                                : const Radius.circular(0),
                                            bottomRight:
                                                Radius.circular(w * .05),
                                            bottomLeft:
                                                Radius.circular(w * .05)),
                                        color: m[i]['isTeacher']
                                            ? Color.fromARGB(255, 145, 114, 255)
                                            : Color.fromARGB(
                                                255, 202, 216, 216),
                                        child: Padding(
                                          padding: m[i]['isTeacher']
                                              ? EdgeInsets.only(
                                                  left: w * .03,
                                                  right: w * .05,
                                                  bottom: h * .01,
                                                  top: h * .01)
                                              : EdgeInsets.only(
                                                  right: w * .04,
                                                  left: w * .05,
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

                                              //Text('1:30 Am', style:   TextStyle(fontSize:w*.033 ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return (Center(
                          child: CircularProgressIndicator(),
                        ));
                      }

                      return Center(
                          child: Text('خطأ في الشبكة',
                              style: TextStyle(fontSize: h * .02)));
                    }),
              ),

//               Container(
//                 height: h * .68,
//                 child: StreamBuilder(
//                     stream:getdata(),
//                     builder: (context, snapshot) {
//                       print(snapshot.data);

//                       var m=snapshot.data;

//                       // print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
//                       if (snapshot.hasData) {
//                         //   print(snapshot.data);
//                         return ListView.builder(
//                          // controller: scrollController,
//                             reverse: true,
//                             //shrinkWrap: true,
//                             itemCount:snapshot.data.length,
//                             itemBuilder: (context, i) {
//                               // DateTime dateTime =
//                               //     DateTime.parse(m[i]['createdAt']);

//                               // String formattedTime =
//                               //     DateFormat('HH:mm').format(dateTime);
//                               //return Text(messages[i]['msg']);

//  if(snapshot.hasData){
//                               return Padding(
//                                 padding:// m[i]['isAdmin']
//                                     // ? EdgeInsets.only(
//                                     //     top: h * .02,
//                                     //     bottom: h * .005,
//                                     //     right: w * .3,
//                                     //     left: w * .024):

//                                     EdgeInsets.only(
//                                         top: h * .02,
//                                         bottom: h * .005,
//                                         left: w * .3,
//                                         right: w * .024),

//                                 child: Column(
//                                   crossAxisAlignment: m[i]['isAdmin']
//                                       ? CrossAxisAlignment.start: CrossAxisAlignment.end,

//                                   children: [
//                                     GestureDetector(
//                                       onTapUp: (details) {
//                                         var dx = details.globalPosition.dx;
//                                         double dy = details.globalPosition.dy;
//                                         double dx2 =
//                                             MediaQuery.of(context).size.width -
//                                                 dx;
//                                         double dy2 =
//                                             MediaQuery.of(context).size.height -
//                                                 dy;
//                                         showMenu(
//                                             context: context,
//                                             position: RelativeRect.fromLTRB(
//                                                 dx, dy, dx2, dy2),
//                                             items: [
//                                               PopupMenuItem(
//                                                   onTap: () {},
//                                                   child: const Text('delete'))
//                                             ]);
//                                       },
//                                       child:
//                                        Material(
//                                         elevation: 5,
//                                         borderRadius: BorderRadius.only(
//                                             topRight: m[i]['isAdmin']
//                                                 ?Radius.circular(w * .05): const Radius.circular(0),

//                                             topLeft: m[i]['isAdmin']
//                                                 ?const Radius.circular(0): Radius.circular(w * .05),

//                                             bottomRight:
//                                                 Radius.circular(w * .05),
//                                             bottomLeft:
//                                                 Radius.circular(w * .05)),
//                                         color: m[i]['isAdmin']
//                                             ? Color.fromARGB(
//                                                 255, 202, 216, 216) :Color.fromARGB(255, 145, 114, 255),

//                                         child: Padding(
//                                           padding: m[i]['isAdmin']
//                                               ?EdgeInsets.only(
//                                                   right: w * .04,
//                                                   left: w * .05,
//                                                   bottom: h * .01,
//                                                   top: h * .01) :EdgeInsets.only(
//                                                   left: w * .03,
//                                                   right: w * .05,
//                                                   bottom: h * .01,
//                                                   top: h * .01),

//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 m[i]['msg'],
//                                                 style: TextStyle(
//                                                     fontSize: w * .044),
//                                                 textAlign: TextAlign.end,
//                                               ),
//                                               // Text(formattedTime,
//                                               //     style: TextStyle(
//                                               //         fontSize: w * .033))
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }

//                               //Text (messages[i]['msg']);
//                             });
//                       }
//  else if(snapshot.connectionState==ConnectionState.waiting){
//                               return Center(child:CircularProgressIndicator() ,);
//                             }

//                       return Center(child: Text('خطأ في الشبكة',style: TextStyle(fontSize:h*.02 ),),);
//                     }),
//               ),
              Padding(
                padding: EdgeInsets.only(
                  left: w * .04,
                  right: w * .04,
                  bottom: w * .01,
                ),
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
                              SharedPreferences pref =
                                  await SharedPreferences.getInstance();
                              var studentId = pref.getString('Id');

                              if (msg.text.isNotEmpty) {
                                await SendMsg();
                                socket!.emit('addUserIdToRedis', studentId);
                                socket!.emit("sendMsg", {
                                  "teacherId": widget.teacherId,
                                  "msg": {
                                    "msgTxt": msg.text,
                                    "createdAt": DateTime.now()
                                  }
                                });
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

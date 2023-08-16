import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 import 'package:schkolla/drawer/drawer.dart';
// import 'package:schkolla/notification/model/model.dart';
//import 'package:schkolla/table/custom%20container.dart';
import 'package:http/http.dart' as http;
 
class SchoolTable extends StatefulWidget {
  const SchoolTable({super.key});

  @override
  State<SchoolTable> createState() => _SchoolTableState();
}

class _SchoolTableState extends State<SchoolTable> {
  List day_1 = [];
  List day_2 = [];
  List day_3 = [];
  List day_4 = [];
  List day_5 = [];

  getdata() async {
    var url = Uri.parse(
        'https://joker.animeraa.com/studentMob/getWeekTable/6437018bc369cbd36656e6a8');
    var res = await http.get(url);
    var body = jsonDecode(res.body);
//print(body);
    return body;
  }

  void initState() {
    // getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        drawer: Drawer(
          width: w * .21,
          backgroundColor: const Color.fromARGB(255, 200, 206, 211),
          child: CostomDrawer(
            top: h * .585,
            left: w * .12,
          ),
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
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: h * .017, left: w * .4),
            child: Text(
              'جدول الحصص',
              style: GoogleFonts.elMessiri(
                fontSize: h * .03,
              ),
            ),
          ),
          toolbarHeight: h * .12,
          backgroundColor: Color.fromARGB(255, 140, 30, 204),
          bottom: TabBar(
              labelStyle: TextStyle(
                  fontWeight: FontWeight.bold, letterSpacing: w * .01),
              labelColor: Color.fromARGB(255, 255, 255, 255),
              indicatorWeight: h * .005,
              unselectedLabelColor: Color.fromARGB(255, 163, 157, 157),
              isScrollable: true,
              indicatorColor: Color.fromARGB(255, 177, 156, 156),
              tabs: [
                Tab(
                  child: Text(
                    'SAT',
                    style: GoogleFonts.elMessiri(
                      fontSize: h * .02,
                    ),
                  ),
                ),
                Tab(
                  child: Text('SUN', style: GoogleFonts.elMessiri(
                      fontSize: h * .02,
                    ),)
                ),
                Tab(
                  child: Text(
                    'MON',
                    style: GoogleFonts.elMessiri(
                      fontSize: h * .02,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'TUE',
                    style: GoogleFonts.elMessiri(
                      fontSize: h * .02,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'WED',
                    style: GoogleFonts.elMessiri(
                      fontSize: h * .02,
                    ),
                  ),
                ),
                // Tab(
                //   child: Text(
                //     'THU',
                //     style: GoogleFonts.elMessiri(
                //       fontSize: h * .02,
                //     ),
                //   ),
                // )
              ]),
        ),
        body: TabBarView(
          children: [     
                           Center(
                child: FutureBuilder(
                    future: getdata(),
                    builder: (BuildContext, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List data1 = snapshot.data;
                       
                        var day1 =
                            data1.where((item) => item['day'] == 1).toList();
                             print(day1);
                        var day2 =
                            data1.where((item) => item['day'] == 2).toList();
                        var day3 =
                            data1.where((item) => item['day'] == 3).toList();
                        var day4 =
                            data1.where((item) => item['day'] == 4).toList();
                        var day5 =
                            data1.where((item) => item['day'] == 5).toList();
                        
                        
                         return ListView.builder(
                            itemCount:  day1. length,
                            itemBuilder: (BuildContext, i) {
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
                  day1[i]['subject'] ,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.normal,
                      fontSize: h * .025,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08),
                  child: Text(
                 day1[i]['time'] ,
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
                              // ContainerForTable(
                              //   model: ModelForTable.fromJson(snapshot.data[i]),
                              // );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(child: Text('خطأ في الشبكة' ,style: TextStyle(fontSize:h*.02 )));
                    })),
                        
                         Center(
                child: FutureBuilder(
                    future: getdata(),
                    builder: (BuildContext, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List data1 = snapshot.data;
                       
                        var day1 =
                            data1.where((item) => item['day'] == 1).toList();
                             print(day1);
                        var day2 =
                            data1.where((item) => item['day'] == 2).toList();
                        var day3 =
                            data1.where((item) => item['day'] == 3).toList();
                        var day4 =
                            data1.where((item) => item['day'] == 4).toList();
                        var day5 =
                            data1.where((item) => item['day'] == 5).toList();
                        
                        
                         return ListView.builder(
                            itemCount:  day2. length,
                            itemBuilder: (BuildContext, i) {
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
                  day2[i]['subject'] ,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.normal,
                      fontSize: h * .025,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08),
                  child: Text(
                 day2[i]['time'] ,
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
                              // ContainerForTable(
                              //   model: ModelForTable.fromJson(snapshot.data[i]),
                              // );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(child: Text('خطأ في الشبكة' ,style: TextStyle(fontSize:h*.02 )));
                    })),
                        
                         Center(
                child: FutureBuilder(
                    future: getdata(),
                    builder: (BuildContext, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List data1 = snapshot.data;
                       
                        var day1 =
                            data1.where((item) => item['day'] == 1).toList();
                             print(day1);
                        var day2 =
                            data1.where((item) => item['day'] == 2).toList();
                        var day3 =
                            data1.where((item) => item['day'] == 3).toList();
                        var day4 =
                            data1.where((item) => item['day'] == 4).toList();
                        var day5 =
                            data1.where((item) => item['day'] == 5).toList();
                        
                        
                         return ListView.builder(
                            itemCount:  day1. length,
                            itemBuilder: (BuildContext, i) {
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
                  day3[i]['subject'] ,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.normal,
                      fontSize: h * .025,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08),
                  child: Text(
                 day3[i]['time'] ,
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
                              // ContainerForTable(
                              //   model: ModelForTable.fromJson(snapshot.data[i]),
                              // );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(child: Text('خطأ في الشبكة' ,style: TextStyle(fontSize:h*.02 )));
                    })),
                        
                         Center(
                child: FutureBuilder(
                    future: getdata(),
                    builder: (BuildContext, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List data1 = snapshot.data;
                       
                        var day1 =
                            data1.where((item) => item['day'] == 1).toList();
                             print(day1);
                        var day2 =
                            data1.where((item) => item['day'] == 2).toList();
                        var day3 =
                            data1.where((item) => item['day'] == 3).toList();
                        var day4 =
                            data1.where((item) => item['day'] == 4).toList();
                        var day5 =
                            data1.where((item) => item['day'] == 5).toList();
                        
                        
                         return ListView.builder(
                            itemCount:  day4. length,
                            itemBuilder: (BuildContext, i) {
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
                  day4[i]['subject'] ,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.normal,
                      fontSize: h * .025,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08),
                  child: Text(
                 day4[i]['time'] ,
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
                              // ContainerForTable(
                              //   model: ModelForTable.fromJson(snapshot.data[i]),
                              // );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(child: Text('خطأ في الشبكة' ,style: TextStyle(fontSize:h*.02 )));
                    })),
                        
                         Center(
                child: FutureBuilder(
                    future: getdata(),
                    builder: (BuildContext, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        List data1 = snapshot.data;
                       
                        var day1 =
                            data1.where((item) => item['day'] == 1).toList();
                             print(day1);
                        var day2 =
                            data1.where((item) => item['day'] == 2).toList();
                        var day3 =
                            data1.where((item) => item['day'] == 3).toList();
                        var day4 =
                            data1.where((item) => item['day'] == 4).toList();
                        var day5 =
                            data1.where((item) => item['day'] == 5).toList();
                        
                        
                         return ListView.builder(
                            itemCount:  day5. length,
                            itemBuilder: (BuildContext, i) {
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
                  day5[i]['subject'] ,
                    style: GoogleFonts.elMessiri(
                      fontWeight: FontWeight.normal,
                      fontSize: h * .025,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: w * .08),
                  child: Text(
                 day5[i]['time'] ,
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
                              // ContainerForTable(
                              //   model: ModelForTable.fromJson(snapshot.data[i]),
                              // );
                            });
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Center(child: Text('خطأ في الشبكة' ,style: TextStyle(fontSize:h*.02 )));
                    })),
                        
                        
                      
          ],
        ),
      ),
    );
  }

}

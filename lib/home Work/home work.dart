import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schkolla/drawer/drawer.dart';
import 'package:schkolla/home%20Work/custom%20home%20work.dart';
import 'package:schkolla/home%20Work/models/homworkModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeworK extends StatefulWidget {
  const HomeworK({super.key});
  @override
  State<HomeworK> createState() => _HomeworKState();
}

class _HomeworKState extends State<HomeworK> {
  @override
  void initState() {
    getdata();
    super.initState();
  }
    getdata() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var classid = prefs.getString('classId');

      var url = Uri.parse(
          'https://joker.animeraa.com/studentMob/getAllHomeWorks/${classid}');

      print(prefs.getString('classId'));

      var res = await http.get(url);
      var body = jsonDecode(res.body);
      print(body);
      return body;
    }
  Widget build(BuildContext context) {
  

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: CostomDrawer(
          top: h * .39,
          left: w * .12,
        ),
        width: w * .21,
        backgroundColor: Color.fromARGB(255, 166, 172, 177),
      ),
      appBar: AppBar(
        leading: Builder(builder: ((context) {
          return GestureDetector(
              onTap: (() {
                Scaffold.of(context).openDrawer();
              }),
              child: Padding(
                padding: EdgeInsets.only(left: w * 0.03),
                child: Container(
                  child: Image(
                    image: AssetImage('lib/home/home Image/Drawer.png'),
                  ),
                ),
              ));
        })),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(h * .034),
          bottomRight: Radius.circular(h * .034),
        )),
        toolbarHeight: h * .1,
        backgroundColor: const Color.fromARGB(255, 121, 59, 172),
      ),
      body: ListView(
        children: [
          Container(
            // color: Colors.blueAccent,
            alignment: Alignment.bottomLeft,
            // color:Colors.amber
            width: w * 0.1, height: h * .07,
            child: Padding(
              padding: EdgeInsets.only(left: w * .05),
              child: Container(
                  height: h * 07,
                  // color: Colors.black,
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                        color: Color.fromARGB(255, 240, 219, 30),
                        iconSize: h * .05,
                      ),
                      Positioned(
                        top: h * .01,
                        right: w * .018,
                        child: CircleAvatar(
                          radius: h * .01,
                          backgroundColor: Colors.red,
                          child: Text('1'),
                        ),
                      )
                    ],
                  )
                  ),
            ),
          ),
          Container(
            // color: Colors.amber,

            // ignore: sort_child_properties_last
            child: Padding(
              padding: EdgeInsets.only(top: h * .0, right: w * .04),
              child: Text(
                "الواجبات",
                textAlign: TextAlign.right,
                style: GoogleFonts.elMessiri(
                    fontSize: h * .037,
                    color: const Color.fromARGB(255, 140, 30, 204)),
              ),
            ),
            height: h * .08, width: double.infinity,
          ),
          //  SizedBox(height: h*.02,),
          
          Container(height: h*.715 ,child:  FutureBuilder(
            future: getdata()
            ,builder:(context,AsyncSnapshot snapshot){
            var m=snapshot.hasData;
              if(snapshot.hasData){
return ListView.builder(
  
  itemCount:snapshot.data.length,
  itemBuilder: (context,i){
return  ContainerForHomeWork(model:HomeworkModel1.fromJson(snapshot.data[i]) ,);
});
              }
              else if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }
              
              return Center(child: Text('خطأ في الشبكة',style: TextStyle(fontSize:h*.02 ),));

          } ),)
         ,
        ],
      ),
    );
  }
}

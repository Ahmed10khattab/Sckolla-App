 

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schkolla/drawer/drawer.dart';
import 'package:schkolla/teacher/custom%20container.dart';
import 'package:schkolla/teacher/model/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Teacherhome extends StatefulWidget {
  const Teacherhome({super.key});

  @override
  State<Teacherhome> createState() => _TeacherhomeState();
}

class _TeacherhomeState extends State<Teacherhome> {
  
  
    

   
  @override
  
  Widget build(BuildContext context) {
     var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
   
getdata() async{

  


 
      SharedPreferences prefs=await SharedPreferences.getInstance();
         var classid = prefs.getString('classId');
      
       
   var url=  Uri.parse('https://joker.animeraa.com/studentMob/getClassTeachers/${classid}');
     
  
      print(  prefs.getString('classId'));
 



  var res=await http.get(url);
  var body=jsonDecode(res.body);
  print(body);
  return body;

}


    return  Scaffold(
      drawer:Drawer(
        child:CostomDrawer(top: h * .79,
                    left: w * .12, ) ,
        width:w*.21 ,backgroundColor: Color.fromARGB(255, 200, 206, 211),) ,
      appBar:AppBar(
        toolbarHeight: h*.1,
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
        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(h * .03),
            bottomRight: Radius.circular(h * .03),
          )),
          backgroundColor: const Color.fromARGB(255, 121, 59, 172),) ,
      body:Padding(
        padding:   EdgeInsets.symmetric(horizontal:w*.02 ),
        child: ListView(children: [
          Padding(
            padding:  EdgeInsets.only(right:w*.05,top: h*.04),
            child: Container(width:double.infinity,child:Text('المعلمين',textDirection:TextDirection.rtl ,style: GoogleFonts.elMessiri(fontSize: h*.037,color:Color.fromARGB(255, 140, 30, 204) ),),),
            
          ),
          SizedBox(height: h*.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Expanded(child: Padding(
              padding:  EdgeInsets. only(left: w*.03),
              child: Text('الصورة',style: GoogleFonts.elMessiri(  
                  fontSize: h * .017, fontWeight: FontWeight.bold), ),
            )), Expanded(child: Padding(
              padding:   EdgeInsets.only(left:w*.02),
              child: Text('الاسم',style: GoogleFonts.elMessiri(  
                  fontSize: h * .017, fontWeight: FontWeight.bold),),
            )), Expanded(flex: 2,child: Padding(
              padding:     EdgeInsets. only( left:w*.02 ),
              child: Text('التخصص',style: GoogleFonts.elMessiri(  
                  fontSize: h * .017, fontWeight: FontWeight.bold),),
            )), Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.only(right:8),
              child: Text('رقم الهاتف',style: GoogleFonts.elMessiri(  
                  fontSize: h * .0139, fontWeight: FontWeight.bold),textDirection:TextDirection.rtl ,),
            )), Expanded(child: Padding(
              padding:  EdgeInsets .only(left:w*.04),
              child: Text('محادثة',style: GoogleFonts.elMessiri(  
                  fontSize: h * .017, fontWeight: FontWeight.bold),),
            )),
            SizedBox(height: h*.05,),
            
           ],),
           Container(
          //color: Colors.amber,
            height: h*.665, 
         
            child: FutureBuilder(
  future: getdata(),
  builder:(BuildContext,AsyncSnapshot snapshot){
  if (snapshot.hasData){
    var date= snapshot.data;
   

   
   print(snapshot.data.length);
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder:(BuildContext,i){
         print('////////////////////////////////////////////');
    print(date[i]['id']);
    var teacherId=date[i]['id'];
    var teachername=date[i]["name"];
    print(teachername);
        print('////////////////////////////');
        
     //  ModelFotTeacher mo =ModelFotTeacher.fromJson(snapshot.data[i]);
       
 return ContainerForTeacher(model:ModelFotTeacher.fromJson(snapshot.data[i]) ,teacherId:teacherId ,Teachername:teachername ,);
    } 
    );
   
  }
    if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(child: Text('خطأ في الشبكة' ,style: TextStyle(fontSize:h*.02 )));
 } 
  ), 
          )
 

          //  ContainerForTeacher(photo: 'lib/teacher/teacherImage/mrs.png', name: 'سارة عبد المجيد', subject: 'اللغة العربية ',phone: '0123456789010',),
          //   ContainerForTeacher(photo:'lib/teacher/teacherImage/mr.png' ,name: 'سارة عبد المجيد', subject: 'اللغة  الانجيزية ',phone: '0123456789010',), ContainerForTeacher(photo: 'lib/teacher/teacherImage/mrs.png', name: 'سارة عبد المجيد', subject: 'اللغة العربية ',phone: '0123456789010',),
          //   ContainerForTeacher(photo:'lib/teacher/teacherImage/mr.png' ,name: 'سارة عبد المجيد', subject: 'اللغة  الانجيزية ',phone: '0123456789010',), ContainerForTeacher(photo: 'lib/teacher/teacherImage/mrs.png', name: 'سارة عبد المجيد', subject: 'اللغة العربية ',phone: '0123456789010',),
          //   ContainerForTeacher(photo:'lib/teacher/teacherImage/mr.png' ,name: 'سارة عبد المجيد', subject: 'اللغة  الانجيزية ',phone: '0123456789010',), ContainerForTeacher(photo: 'lib/teacher/teacherImage/mrs.png', name: 'سارة عبد المجيد', subject: 'اللغة العربية ',phone: '0123456789010',),
          //   ContainerForTeacher(photo:'lib/teacher/teacherImage/mr.png' ,name: 'سارة عبد المجيد', subject: 'اللغة  الانجيزية ',phone: '0123456789010',), ContainerForTeacher(photo: 'lib/teacher/teacherImage/mrs.png', name: 'سارة عبد المجيد', subject: 'اللغة العربية ',phone: '0123456789010',),
          //   ContainerForTeacher(photo:'lib/teacher/teacherImage/mr.png' ,name: 'سارة عبد المجيد', subject: 'اللغة  الانجيزية ',phone: '0123456789010',)
        ]),
      ),
    );
  }
}
import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schkolla/Animation/animation.dart';
import 'package:schkolla/drawer/drawer.dart';
import 'package:schkolla/home%20Work/home%20work.dart';
import 'package:schkolla/home/custom%20container.dart';
import 'package:schkolla/notification/notification.dart';
import 'package:schkolla/question/question.dart';
import 'package:schkolla/report/provider/dateProvider.dart';
import 'package:schkolla/report/report.dart';
import 'package:schkolla/table/table.dart';
import 'package:schkolla/teacher/teacher%20home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    
    return Scaffold(
      drawer:Drawer(
        child:CostomDrawer(top: h * .173,
                    left: w * .12,   ) ,
              
        
        width:w*.21 ,backgroundColor: Color.fromARGB(255, 200, 206, 211),) ,
        appBar: AppBar(
          leading: Builder(builder: ((context) {
            return GestureDetector(
                onTap: (() {
                  Scaffold.of(context).openDrawer();
                }),
                child: Padding(
                  padding:  EdgeInsets.only(left:w*0.03),
                  child: Container(
 
                    child:   Image(
                        image: AssetImage('lib/home/home Image/Drawer.png'), ),
                  ),
                ));
          })),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(h*.034),
            bottomRight: Radius.circular(h*.034),
          )),
          backgroundColor: const Color.fromARGB(255, 121, 59, 172),
          toolbarHeight: h * .1,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: w * .015),
               child://SvgPicture.asset('lib/images/106.svg',width: 40,)
               Image(
                  height: h * .24,
                  width: w * .24,
                   image: const AssetImage('lib/home/home Image/3.png')),
            ),
          ],
        ),
        body: ListView(children: [
          SizedBox(
            height: h * .02,
          ),
          Text(
            'الصفحة الرئيسية',
            textAlign: TextAlign.center,
            style:  GoogleFonts.elMessiri(
                    fontSize: h * .04,
                    color: const Color.fromARGB(255, 140, 30, 204)),
          ),
          SizedBox(
            height: h * .02,
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context).push(Slider1(Page: notification()));
              },
              child: ContainerForHome(
                colors: Color.fromARGB(255, 94, 46, 133),
                name: 'اشعارات التنقل ',
                imag1: 'lib/home/home Image/4.png',
                imag2: 'lib/home/home Image/9.png',
              )),
          GestureDetector(
            onTap: () {
               Navigator.of(context).push(SliderRight(Page: HomeworK()));
            },
            child: ContainerForHome(
              colors: Color.fromARGB(255, 236, 220, 75),
              name: 'الواجبات',
              imag1: 'lib/home/home Image/5.png',
              imag2: 'lib/home/home Image/11.png',
            ),
          ),
          GestureDetector(
            onTap: ()async {
            //  var f=Provider.of<Pro1>(context).formattedDates;
             await Provider.of<Pro1>(context,listen: false).getdata();
               Navigator.of(context).push(SliderRight(Page:  Report()));
            },
            child: ContainerForHome(
              colors: Color.fromARGB(255, 158, 174, 218),
              name: ' ايام الحضور',
              imag1: 'lib/home/home Image/10.png',
              imag2: 'lib/home/home Image/12.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(Slider1(Page: SchoolTable()));
            },
            child: ContainerForHome(
              colors: Colors.orange,
              name: 'جدول الحصص',
              imag1: 'lib/home/home Image/7.png',
              imag2: 'lib/home/home Image/13.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(SliderRight(Page: Qestion()));
            },
            child: ContainerForHome(
              colors: Colors.green,
              name: 'الاسالة والشكاوي',
              imag1: 'lib/home/home Image/8.png',
              imag2: 'lib/home/home Image/14.png',
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(Slider1(Page: Teacherhome()));
            },
            child: ContainerForHome(
              colors: Color.fromARGB(255, 55, 132, 196),
              name: 'المعلمين',
              imag1: 'lib/home/home Image/6.png',
              imag2: 'lib/home/home Image/15.png',
            ),
          )
        ]));
  }
}

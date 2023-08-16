import 'package:flutter/material.dart';
 
import 'package:schkolla/home%20Work/home%20work.dart';
import 'package:schkolla/home/home.dart';
import 'package:schkolla/notification/notification.dart';
 import 'package:schkolla/report/report.dart';
import 'package:schkolla/table/table.dart';
import 'package:schkolla/teacher/chat%20teacher.dart';
import 'package:schkolla/teacher/teacher%20home.dart';

// ignore: must_be_immutable
class CostomDrawer extends StatefulWidget {
   CostomDrawer({super.key,@required this.left,@required this.top});
  double ?top;
  double ?left;
  @override
  State<CostomDrawer> createState() => _CostomDrawerState();
}

class _CostomDrawerState extends State<CostomDrawer> {
  bool selectedIcon = false;
  @override
  Widget build(BuildContext context) {
    //bool selectedIcon = false;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: w * .8,
          color: Color.fromARGB(255, 104, 24, 151),
          height: h * 1,
          child: Stack(
              // alignment: Alignment.centerRight,
              children: [
                // Positioned(
                //   top: h * .15,
                //   right: w * .0,
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(h * .02),
                //             bottomLeft: Radius.circular(h * .02))),
                //     width: w * .57,
                //     height: h,
                //     child: Padding(
                //       padding: EdgeInsets.only(top: h * .01),
                //       child: Column(
                //         children: [
                //           SizedBox(
                //             height: h * .02,
                //           ),
                //           GestureDetector(
                //               onTap: (() {
                //                 Navigator.of(context).push(MaterialPageRoute(
                //                     builder: (context) => Home()));
                //               }),
                //               child: Text(
                //                 'الصفحة الرئيسية ',
                //                 textAlign: TextAlign.center,
                //                 style: GoogleFonts.elMessiri(
                //                     fontSize: h * .03,
                //                     color: const Color.fromARGB(
                //                         255, 140, 30, 204)),
                //               )),
                //           SizedBox(
                //             height: h * .02,
                //           ),
                //           GestureDetector(
                //               onTap: () {
                //                 Navigator.of(context).push(MaterialPageRoute(
                //                     builder: ((context) => notification())));
                //               },
                //               child: ContainerForDrawer(
                //                 colors: Color.fromARGB(255, 94, 46, 133),
                //                 name: 'اشعارات التنقل ',
                //                 imag1: 'lib/home/home Image/4.png',
                //                 imag2: 'lib/home/home Image/9.png',
                //               )),
                //           SizedBox(
                //             height: h * .002,
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: ((context) => HomeworK())));
                //             },
                //             child: ContainerForDrawer(
                //               colors: Color.fromARGB(255, 236, 220, 75),
                //               name: 'الواجبات',
                //               imag1: 'lib/home/home Image/5.png',
                //               imag2: 'lib/home/home Image/11.png',
                //             ),
                //           ),
                //           SizedBox(
                //             height: h * .002,
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: ((context) => Report())));
                //             },
                //             child: ContainerForDrawer(
                //               colors: Color.fromARGB(255, 158, 174, 218),
                //               name: 'التقارير المدرسية',
                //               imag1: 'lib/home/home Image/10.png',
                //               imag2: 'lib/home/home Image/12.png',
                //             ),
                //           ),
                //           SizedBox(
                //             height: h * .002,
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: ((context) => SchoolTable())));
                //             },
                //             child: ContainerForDrawer(
                //               colors: Colors.orange,
                //               name: 'جدول الحصص',
                //               imag1: 'lib/home/home Image/7.png',
                //               imag2: 'lib/home/home Image/13.png',
                //             ),
                //           ),
                //           SizedBox(
                //             height: h * .002,
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: ((context) => Qestion())));
                //             },
                //             child: ContainerForDrawer(
                //               colors: Colors.green,
                //               name: 'الاسالة والشكاوي',
                //               imag1: 'lib/home/home Image/8.png',
                //               imag2: 'lib/home/home Image/14.png',
                //             ),
                //           ),
                //           SizedBox(
                //             height: h * .002,
                //           ),
                //           GestureDetector(
                //             onTap: () {
                //               Navigator.of(context).push(MaterialPageRoute(
                //                   builder: ((context) => Teacherhome())));
                //             },
                //             child: ContainerForDrawer(
                //               colors: Color.fromARGB(255, 55, 132, 196),
                //               name: 'المعلمين',
                //               imag1: 'lib/home/home Image/6.png',
                //               imag2: 'lib/home/home Image/15.png',
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Positioned(
                    top:widget. top,
                    //  h * .166,
                    left:widget. left,
                    // w * .099,
                    child: Icon(
                      Icons.arrow_left_outlined,
                      size: h * .07,
                      color: Colors.white,
                    )),
                Positioned(
                    top: h * .04,
                    left: w * .04,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          //color: Colors.amber,
                          height: h * .08,
                          width: w * .08,
                          child: Image(
                            image: AssetImage('lib/home/home Image/Drawer.png'),
                            fit: BoxFit.contain,
                          )),
                    )),
                // Positioned(
                //     right: w * .01,
                //     top: h * .001,
                //     child: Stack(
                //       children: [
                //         Container(
                //             height: h * .2,
                //             width: w * .2,
                //             child: Image(
                //               image: AssetImage('lib/home/home Image/106.png'),
                //               fit: BoxFit.contain,
                //             )),
                //       ],
                // )
                // ),
                Positioned(
                  top: h * .17,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) =>Home() )));
                        },
                        icon: Icon(Icons.home_outlined),
                        iconSize: h * .06,
                        color: Color.fromARGB(255, 223, 213, 213),
                      ),
                      SizedBox(
                        height: h * .04,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => notification())));
                        },
                        child: Container(
                          // color: Colors.black,
                          height: h * .05,
                          width: w * .1,
                          child: Image(
                              image: AssetImage('lib/home/home Image/9.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(
                        height: h * .06,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => HomeworK())));
                        },
                        child: Container(
                          // color: Colors.black,
                          height: h * .05,
                          width: w * .1,
                          child: Image(
                              image: AssetImage('lib/home/home Image/11.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(
                        height: h * .04,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Report())));
                        },
                        child: Container(
                          // color: Colors.black,
                          height: h * .05,
                          width: w * .1,
                          child: Image(
                              image: AssetImage('lib/home/home Image/12.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(
                        height: h * .055,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => SchoolTable())));
                        },
                        child: Container(
                          //color: Colors.black,
                          height: h * .05,
                          width: w * .1,
                          child: Image(
                              image: AssetImage('lib/home/home Image/13.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(
                        height: h * .06,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => ChatTeacher())));
                        },
                        child: Container(
                          //  color: Colors.black,
                          height: h * .05,
                          width: w * .1,
                          child: Image(
                              image: AssetImage('lib/home/home Image/14.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(
                        height: h * .04,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => Teacherhome())));
                        },
                        child: Container(
                          //   color: Colors.black,
                          height: h * .05,
                          width: w * .1,
                          child: Image(
                              image: AssetImage('lib/home/home Image/15.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ],
    );
  }
}

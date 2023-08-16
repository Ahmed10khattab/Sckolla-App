import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schkolla/home%20Work/models/homworkModel.dart';
 
 
class ContainerForHomeWork extends StatefulWidget {
  ContainerForHomeWork({Key? key,@required this.model ,
 // @required this.ObjectName,@required this.homework
  }) : super(key: key);
  // String? ObjectName;
  // String? homework;
HomeworkModel1 ?model;
  
   
  @override
  State<ContainerForHomeWork> createState() => _ContainerForHomeWorkState();
}

class _ContainerForHomeWorkState extends State<ContainerForHomeWork> {
  late ScrollController sc;

  double l = 0;
  double w = 0;
  bool isMore = false;
  late var t = l * .166;
  late double m = w;
  @override
  void initState() {
    sc = new ScrollController();
    sc.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget text1(String text, TextStyle style) {
      final maxline = isMore ? null : null;
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: m * .02),
        child: Text(
          text,
          maxLines: maxline,
          textAlign: TextAlign.end,
          style: TextStyle(fontSize: m * .04),
        ),
      );
    }

   

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
     text2(String text) {
     // final maxline = isMore ? null : null;
      return Padding(
        padding: EdgeInsets.only(right: m * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              textAlign: TextAlign.end,
             
              style:GoogleFonts.elMessiri(fontSize: h*.017,color:Color.fromARGB(255, 8, 8, 8) ), 
            )
          ],
        ),
      );
    }
    l = h;
    m = w;
    return Padding(
      padding: EdgeInsets.symmetric(
       // vertical: h*.001,
        horizontal: w * .05),
      child: Column(
        children: [

          Text('اليوم',style: TextStyle(fontSize: h*.02,color: Color.fromARGB(255, 97, 93, 93)),),
           
           TweenAnimationBuilder(
        duration: Duration(milliseconds:500),
        tween: Tween<double>(begin: 1, end: 0),
        builder: (context,double value, child) {
          return Transform.translate(
            offset: Offset(value*300,0.0),
            child: child!);
        },
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(blurRadius: w*.02,color: Colors.black45),
                  ],
                  borderRadius: BorderRadius.circular(w * .06),
                  color: Color.fromARGB(255, 255, 255, 255)
                  ),
              height: t,
              child: ListView(
                 
                physics: !isMore ? NeverScrollableScrollPhysics() : null,
                controller: sc,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:w*.02,right:w*.02),
                    child: Padding(
                      padding:   EdgeInsets.only(top:h*.03),
                      child: Column(
                        children:[
                          Padding(
                            padding:  EdgeInsets.only (right: w*.02,top:h*.006),
                            child: Container(
                              width: double.infinity,
                              child: Text(widget.model!.subjectName!,textDirection:TextDirection.rtl,style:GoogleFonts.elMessiri(fontSize: h*.02,color:const Color.fromARGB(255, 140, 30, 204) ), )),
                          ),
                             Padding(
                               padding: EdgeInsets.only (right: w*.02 ),
                               child: Container(
                            width: double.infinity,
                            child: Text(widget.model!.title! ,textDirection:TextDirection.rtl,style:GoogleFonts.elMessiri(fontSize: h*.02,color:const Color.fromARGB(255, 140, 30, 204) ), )),
                             ),
                            
                            Padding(
                              padding: EdgeInsets.only (right: w*.02 ),
                              child: Container(
                              width: double.infinity,
                              child: Text('تفاصيل الواجب :'  ,textDirection:TextDirection.rtl,style:GoogleFonts.elMessiri(fontSize: h*.02,color:const Color.fromARGB(255, 140, 30, 204) ), )),
                            ),
                            
                          GestureDetector(
                               onTap: () {
                                      isMore
                                          ? null
                                          : setState(() {
                                              isMore = !isMore;
                                              t = h * .3;
                                              sc.jumpTo(h);
                                            });
                                    },
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: w * .1,
                                color:
                                    isMore ? Colors.white : Colors.black,
                              )),
                        ],
                      ),
                    ),
                  ),
                    text2(
                 widget.model!.desc!  ,
                  ),
                  
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isMore = !isMore;
                        t = h * .14;
                        sc.jumpTo(h * .03);
                      });
                    },
                    child: Column(
                      children: [Icon(Icons.arrow_drop_up,size: h*.05,), Text("Cancel",style: TextStyle(fontSize: h*.015),)],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: h * .02,
          )
        ],
      ),
    );
  }
}



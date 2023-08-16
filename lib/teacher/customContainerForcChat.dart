 
 import 'package:flutter/material.dart';
import 'package:schkolla/teacher/custom%20container.dart';
 
// ignore: must_be_immutable
class MessageForComplaint extends StatefulWidget {
  MessageForComplaint(
      {Key? key,
    required this.model
      // required this.isme,
      // required this.SignUpUser,
      // required this.massge,
      // this.image,
    
      //   this.delete
        })
      : super(key: key);
    Messages3 ?model;

  @override
  State<MessageForComplaint> createState() => _MessageForComplaintState();
}

class _MessageForComplaintState extends State<MessageForComplaint> {
  // String massge;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding:widget.model!.isAdmin!    ?  EdgeInsets.only(top:h*.02,bottom: h*.005 ,left:w*.3,right: w*.024 ):EdgeInsets.only(top:h*.02,bottom: h*.005,right:w*.3,left:  w*.024),
      child: Column(
        crossAxisAlignment: widget.model!.isAdmin! 
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
           
          
          GestureDetector(
            onTapUp: (details) {
              var dx = details.globalPosition.dx;
              double dy = details.globalPosition.dy;
              double dx2 = MediaQuery.of(context).size.width - dx;
              double dy2 = MediaQuery.of(context).size.height - dy;
              showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                  items: [
                    PopupMenuItem(
                        onTap: () {
                           
                        },
                        child: const Text('delete'))
                  ]);
            },
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.only(
                  topRight: widget.model!.isAdmin! 
                      ? const Radius.circular(0)
                      :  Radius.circular(w*.05),
                  topLeft:widget.model!.isAdmin! 
                      ?  Radius.circular(w*.05)
                      : const Radius.circular(0),
                  bottomRight:  Radius.circular(w*.05),
                  bottomLeft:  Radius.circular(w*.05)),
              color:widget.model!.isAdmin! 
                  ? Color.fromARGB(255, 145, 114, 255)
                  :Color.fromARGB(255, 202, 216, 216),
              child: Padding(
                padding:
                   widget.model!.isAdmin! ?   EdgeInsets.only( left: w*.03,right: w*.05,bottom: h*.01,top: h*.01):EdgeInsets.only( right: w*.04,left: w*.05,bottom: h*.01,top: h*.01),
                child: Column(
 crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model!.msg! ,
                      style:   TextStyle(fontSize:w*.044 ),textAlign: TextAlign.end ,



                    ),
                     
                    Text('1:30 Am', style:   TextStyle(fontSize:w*.033 ))
                  ],
                ),
              ),
            ),
          ),
           
        ],
      ),
    );
  }
}

 



 
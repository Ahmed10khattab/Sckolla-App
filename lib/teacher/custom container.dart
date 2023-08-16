import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schkolla/teacher/chat%20teacher.dart';
import 'package:schkolla/teacher/model/models.dart';

// ignore: must_be_immutable
class ContainerForTeacher extends StatefulWidget {
  ContainerForTeacher(
      {super.key,
      @required this.model,
      @required this.Teachername,
      @required this.teacherId,
      //  @required this.photo,
      // @required this.subject
      });
 ModelFotTeacher? model;

 
 String? Teachername;
 String? teacherId;
  // String? phone;
  // String? photo;

  @override
  State<ContainerForTeacher> createState() => _ContainerForTeacherState();
}

class _ContainerForTeacherState extends State<ContainerForTeacher> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical:h*.02 ,horizontal:w*.01 ),
          decoration: BoxDecoration(color: Color.fromARGB(255, 226, 226, 226),
          ),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child:
                      Container(
                        height: h*.07,
                        width: w*.07,
                        child:Image.network(widget.model!.image,fit: BoxFit.contain,)  
                        )),
              Expanded(
                flex: 1,
                child: Text(
                  widget.model!.name,
                  style: GoogleFonts.elMessiri(
                    fontSize: h * .018,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    widget.model!.role,
                    style: GoogleFonts.elMessiri(
                      fontSize: h * .019,
                    ),textDirection: TextDirection.rtl
                  )),
              Expanded(
                flex: 2,
                child: Text(
                  
                  widget.model!.phoneNumber,
                  style: GoogleFonts.elMessiri(  
                      fontSize: h * .017, fontWeight: FontWeight.bold),textDirection: TextDirection.rtl,
                ),
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ChatTeacher(teacherId:widget.teacherId ,techername:widget.Teachername ,), ));
                  } ,
                    child: Container(
                      height: h * .055,
                      width: w * .055,
                      child: Image(
                        image: AssetImage('lib/teacher/teacherImage/chat.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(height: h*.02,)
      ],
    );
  }
}


// class Msg {
//   List<Messages3>? messages;
//   int? currentPage;
//   int? totalPages;

//   Msg({this.messages, this.currentPage, this.totalPages});

//   Msg.fromJson(Map<String, dynamic> json) {
//     if (json['messages'] != null) {
//       messages = <Messages3>[];
//       json['messages'].forEach((v) {
//         messages!.add(new Messages3.fromJson(v));
//       });
//     }
//     currentPage = json['currentPage'];
//     totalPages = json['totalPages'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.messages != null) {
//       data['messages'] = this.messages!.map((v) => v.toJson()).toList();
//     }
//     data['currentPage'] = this.currentPage;
//     data['totalPages'] = this.totalPages;
//     return data;
//   }
// }

class Messages3 {
  String? sId;
  bool? isAdmin;
  String? msg;
  String? createdAt;

  Messages3({this.sId, this.isAdmin, this.msg, this.createdAt});

  Messages3.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isAdmin = json['isAdmin'];
    msg = json['msg'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isAdmin'] = this.isAdmin;
    data['msg'] = this.msg;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

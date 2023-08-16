import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schkolla/Animation/animation.dart';
import 'package:schkolla/home/home.dart';
import 'package:http/http.dart' as http;
 import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  validation() {
    var current = formkey.currentState;
    if (current!.validate()) {
      current.save();
    }
  }

  @override
  void initState() {

    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = Uri.parse('https://joker.animeraa.com/studentMob/login/');
    final headers = {'Content-Type': 'application/json'};
    //final body = jsonEncode({"email":"rana@mail.com" , "password":"123456789"});
    final body = jsonEncode({"email": email.text, "password": password.text});
   
    saveGradeID() async {
      final response = await http.post(url, headers: headers, body: body);
      var body1 = jsonDecode(response.body);
      var classId = body1['classId'];
      var studentId=body1["id"];
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setString('classId', classId);
       prefs.setString('Id', studentId);
     // print('saved +${classId}');
     
    }


getGradeID() async {
 
      SharedPreferences prefs=await SharedPreferences.getInstance();
     var classId= prefs.getString('classId');
     
     print(classId);
     
    }





    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    void showBottomSheet1(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w * .1),
                color: Color.fromARGB(255, 54, 107, 156)),
            height: h * .04,
            child: Center(
              child: Text('كلمة المرور او الاميل غير صحيحة'),
            ),
          );
        },
      );
    }

// Future<http.Response> fetchUserData() async {
//   final response = await http.get(Uri.parse('https://joker.animeraa.com/studentMob/login/'));

//   if (response.statusCode == 200) {
//     return response;
//   } else {
//     throw Exception('Failed to load user data');
//   }
// }

    Future<void> createPostRequest() async {
      final url = Uri.parse('https://joker.animeraa.com/studentMob/login/');
      final headers = {'Content-Type': 'application/json'};
       final body = jsonEncode({"email": email.text, "password": password.text});

      try {
        final response = await http.post(url, headers: headers, body: body);
        var body1 = jsonDecode(response.body);
        print(body1);
  print(response.body);
        return body1;

        // print(response.statusCode);
       // print(response.body);
      } catch (error) {
        print('Error: $error');
      }
    }

    return Form(
      key: formkey,
      child: Scaffold(
        body: ListView(
          children: [
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1400),
              tween: Tween<double>(begin: h * 0.2, end: 0),
              child: Container(
                //color: Colors.black,
                height: h * .3,
                width: double.infinity,
                child: const Image(
                  image: AssetImage('lib/login/login Image/2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              builder: (context, double value, child) {
                return Transform.translate(
                    offset: Offset(0.0, value * -h * 0.03), //-h*0.03
                    child: child!);
              },
            ),
            TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1400),
              tween: Tween<double>(begin: h * 0.2, end: 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 121, 59, 172),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(h * .04),
                        topRight: Radius.circular(h * .04))),
                height: h * .7,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: w * .08, right: w * .08, top: h * .1),
                  child: ListView(
                    children: [
                      //  Center(child: CircularProgressIndicator(color: Colors.amber,)),

                      Container(
                        height: h * .5,
                        width: double.infinity,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: email,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return ('ادخل الاميل');
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  //  border: ,
                                  focusColor:
                                      Color.fromARGB(255, 202, 178, 178),
                                  // enabledBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.white) ),
                                  // focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.white) ),
                                  hintText: 'البريد الاكترونية',
                                  hintStyle: GoogleFonts.elMessiri(
                                      fontSize: h * .027,
                                      color:
                                          Color.fromARGB(255, 250, 244, 253)),
                                  suffixIcon: Icon(
                                    Icons.email,
                                    size: h * .04,
                                    color: Colors.white,
                                  ),
                                  hintTextDirection: TextDirection.rtl),
                            ),
                            SizedBox(
                              height: h * .05,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'ادخل كلمة المرور';
                                }
                                return null;
                              },
                              controller: password,
                              obscureText: true,
                              decoration: InputDecoration(
                                  focusColor:
                                      Color.fromARGB(255, 202, 178, 178),
                                  // enabledBorder:OutlineInputBorder(borderSide:BorderSide(color: Colors.white) ),
                                  // focusedBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.white) ),
                                  hintText: 'كلمة المرور',
                                  hintStyle: GoogleFonts.elMessiri(
                                      fontSize: h * .027,
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  suffixIcon: Icon(
                                    Icons.lock,
                                    size: h * .04,
                                    color: Colors.white,
                                  ),
                                  hintTextDirection: TextDirection.rtl),
                            ),
                            SizedBox(
                              height: h * .1,
                            ),
                            Center(
                              child: _isLoading
                                  ? CircularProgressIndicator()
                                  : MaterialButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * .01)),
                                      height: h * .06,
                                      color: Colors.white,
                                      onPressed: () async {
                                       
                                       saveGradeID();
                                         getGradeID();
                                       validation();

                                        setState(() {
                                          _isLoading = true;
                                        });
                                        var res1 = await http.post(url,
                                            headers: headers, body: body);

                                       if (res1.statusCode == 200) {
                                          Navigator.of(context)
                                              .push(SliderRight(Page: Home()));

                                          setState(() {
                                            _isLoading = false;
                                          });
                                        }
                                         else {
                                          print('some thing  is wrong');
                                          setState(() {
                                            _isLoading = false;
                                          });

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              'الاميل او كلمة المرور غير صحيحة , حاول مرة اخري',
                                              textDirection: TextDirection.rtl,
                                              style:
                                                  TextStyle(fontSize: w * .04),
                                            ),
                                          ));
                                       }

                                      createPostRequest();
                                     }
                                     ,
                                      child: Text(
                                        'تسجيل الدخول',
                                        style: GoogleFonts.elMessiri(
                                            fontSize: h * .027,
                                            color: const Color.fromARGB(
                                                255, 140, 30, 204)),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              builder: (context, double value, child) {
                return Transform.translate(
                    offset: Offset(0.0, value * h * 0.3), //-h*0.03
                    child: child!);
              },
            ),
          ],
        ),
      ),
    );
  }
}

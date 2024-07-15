import 'package:flutter/services.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:test_app/Dashboard.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/img1.jpeg', fit: BoxFit.cover),
            ),
            AnimatedLoginPart(),
          ],
        ),
      ),
    );
  }
}

class AnimatedLoginPart extends StatefulWidget {
  const AnimatedLoginPart({super.key});

  @override
  _AnimatedLoginPartState createState() => _AnimatedLoginPartState();
}

class _AnimatedLoginPartState extends State<AnimatedLoginPart> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool passwordShow = false;
  bool isChecked = false;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    email = TextEditingController(text: "");
    email.addListener(() {
      setState(() {});
    });
    password = TextEditingController(text: "");
    password.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlurryModalProgressHUD(
        inAsyncCall: loading,
        blurEffectIntensity: 4,
        offset: Offset((screenWidth / 2 - 35), (screenHeight / 2 + 100)),
        progressIndicator: LoadingAnimationWidget.horizontalRotatingDots(
            color: Color.fromRGBO(34, 145, 214, 1), size: 70),
        dismissible: false,
        opacity: 0.6,
        color: Colors.black87,
        child: Column(
          children: [
            Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding:
                        const EdgeInsets.only(left: 45, top: 264, bottom: 75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 154,
                        ),
                      ],
                    ))),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 45, left: 45),
                child: TextFormField(
                  controller: email,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey.shade500,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey.shade500,
                      )),
                      hintText: 'USERNAME or EMAIL ADDRESS',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          email.text.isEmpty
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    // Change the status here
                                    email.clear();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                        ],
                      )),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 45, left: 45, top: 50),
                child: TextFormField(
                  controller: password,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: passwordShow ? false : true,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey.shade500,
                      )),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey.shade500,
                      )),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(
                                8.0), // or EdgeInsets.only(left: 8.0) for left margin
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  passwordShow = !passwordShow;
                                });
                              },
                              child: passwordShow == true
                                  ? Icon(
                                      Icons.remove_red_eye_outlined,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                            ),
                          ),
                          password.text.isEmpty
                              ? Container()
                              : InkWell(
                                  onTap: () {
                                    // Change the status here
                                    password.clear();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                        ],
                      )),
                ),
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 45, top: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          activeColor: Colors.white60,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text('Remember Me',
                            style: TextStyle(
                                color: Colors.white60,
                                fontSize: 14)), // Add your label text here
                      ],
                    ))),
            Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: LoadingBtn(
                    height: 70,
                    borderRadius: 40,
                    // animate: true,
                    color: email.text.isEmpty || password.text.isEmpty
                        ? Color.fromRGBO(11, 45, 66, 1)
                        : Color.fromRGBO(34, 145, 214, 1),
                    width: 300,

                    loader: Container(
                        padding: const EdgeInsets.all(10),
                        // child: const CircularProgressIndicator(
                        //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        // ),
                        child: LoadingAnimationWidget.horizontalRotatingDots(
                            color: Colors.white, size: 50)),
                    child: Text(
                      "Sign In",
                      style: email.text.isEmpty || password.text.isEmpty
                          ? TextStyle(
                              color: Color.fromRGBO(79, 80, 82, 1),
                              fontSize: 25)
                          : TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    onTap: (startLoading, stopLoading, btnState) async {
                      if (!email.text.isEmpty && !password.text.isEmpty) {
                        if (btnState == ButtonState.idle) {
                          setState(() {
                            loading = true;
                          });

                          // call your network api
                          await Future.delayed(const Duration(seconds: 3));

                          setState(() {
                            loading = false;
                          });

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashboardScreen()),
                          );
                        }
                      }
                    },
                  ),
                )),
          ],
        ));
  }
}

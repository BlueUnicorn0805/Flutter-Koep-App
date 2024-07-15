import 'package:flutter/services.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:test_app/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
            AnimatedLoginButton(),
          ],
        ),
      ),
    );
  }
}

class AnimatedLoginButton extends StatefulWidget {
  const AnimatedLoginButton({super.key});

  @override
  _AnimatedLoginButtonState createState() => _AnimatedLoginButtonState();
}

class _AnimatedLoginButtonState extends State<AnimatedLoginButton> {
  TextEditingController serverName = TextEditingController();
  final FocusNode focusNode = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    serverName = TextEditingController(text: "");
    serverName.addListener(() {
      setState(() {});
    });

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          isFocused = true;
        });
      } else {
        setState(() {
          isFocused = false;
        });
      }
    });
  }

  @override
  void dispose() {
    serverName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 45, top: 264, bottom: 113),
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
              controller: serverName,
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
                  hintText: isFocused ? '' : 'ENTER YOUR KEOP SERVER URL',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  suffixIcon: serverName.text.isEmpty
                      ? null
                      : InkWell(
                          onTap: () {
                            // Change the status here
                            serverName.clear();
                          },
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 14,
                          ))),
              onTap: () {
                isFocused = true;
              },
              focusNode: focusNode,
            ),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 45, top: 50),
              child: LoadingBtn(
                height: 47,
                borderRadius: 30,
                // animate: true,
                color: serverName.text.isEmpty
                    ? Color.fromRGBO(11, 45, 66, 1)
                    : Color.fromRGBO(34, 145, 214, 1),
                width: 140,

                loader: Container(
                    padding: const EdgeInsets.all(10),
                    // child: const CircularProgressIndicator(
                    //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    // ),
                    child: LoadingAnimationWidget.horizontalRotatingDots(
                        color: Colors.white, size: 50)),
                child: Text(
                  "CONNECT",
                  style: serverName.text.isEmpty
                      ? TextStyle(
                          color: Color.fromRGBO(79, 80, 82, 1), fontSize: 16)
                      : TextStyle(color: Colors.white, fontSize: 16),
                ),
                onTap: (startLoading, stopLoading, btnState) async {
                  if (!serverName.text.isEmpty) {
                    if (btnState == ButtonState.idle) {
                      startLoading();
                      // call your network api
                      await Future.delayed(const Duration(seconds: 3));
                      stopLoading();

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
                  }
                },
              ),
            )),
      ],
    );
  }
}

class SharedPreferences {}

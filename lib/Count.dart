import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:test_app/Dashboard.dart';

class CountScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                  color: Colors.black, // Set the color of the container
                  child: Opacity(
                    opacity: 0.2, // Set the opacity value between 0.0 and 1.0
                    child: Image.asset('assets/images/img1.jpeg',
                        fit: BoxFit.cover),
                  )),
            ),
            MainContainer()
          ],
        ),
      ),
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  MainContainerState createState() => MainContainerState();
}

class MainContainerState extends State<MainContainer> {
  bool loading = false;

  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlurryModalProgressHUD(
      inAsyncCall: loading,
      blurEffectIntensity: 4,
      progressIndicator: LoadingAnimationWidget.horizontalRotatingDots(
          color: Color.fromRGBO(34, 145, 214, 1), size: 70),
      dismissible: false,
      opacity: 0.6,
      color: Colors.black87,
      child: Column(
        children: [
          Header(),
          UserCard(),
          MainPart(isLoading: loading, setLoading: setLoading)
        ],
      ),
    ));
  }
}

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  HeaderState createState() => HeaderState();
}

class HeaderState extends State<Header> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        height: 100,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DashboardScreen()),
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 25,
                            semanticLabel: 'Navigation Icon',
                          ),
                        )),
                    Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                      height: 25,
                      color: Colors.white,
                    ),
                  ],
                ),
                Icon(
                  Icons.view_headline,
                  color: Colors.white,
                  size: 25,
                  semanticLabel: 'Navigation Icon',
                ),
              ],
            )));
  }
}

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  UserCardState createState() => UserCardState();
}

class UserCardState extends State<UserCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Set the border radius
            child: Container(
                color: Color.fromRGBO(34, 145, 214, 0.3),
                height: 160,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 124,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('FULL COUNT',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24)),
                                  Text('count #305032',
                                      style: TextStyle(
                                          color: Color.fromRGBO(
                                              221, 221, 221, 0.7),
                                          fontSize: 14)),
                                ],
                              )
                            ],
                          )),
                      Container(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          height: 36,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('STARTED TODAY AT 8:30 AM BY AMANDA J',
                                  style: TextStyle(
                                      color: Color.fromRGBO(221, 221, 221, 0.7),
                                      fontSize: 12)),
                            ],
                          ))
                    ]))));
  }
}

class LocationCard extends StatefulWidget {
  const LocationCard({super.key});

  @override
  LocationCardState createState() => LocationCardState();
}

class LocationCardState extends State<LocationCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(30, 30, 30, 1),
        height: 50,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('DALLAS',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Text('change location',
                    style: TextStyle(
                        color: Color.fromRGBO(221, 221, 221, 1), fontSize: 11)),
              ],
            )));
  }
}

class MainPart extends StatefulWidget {
  final bool isLoading; // Declare a final isLoading parameter
  final Function(bool) setLoading;

  const MainPart({required this.isLoading, required this.setLoading});

  @override
  MainPartState createState() => MainPartState();
}

class MainPartState extends State<MainPart> {
  bool isloading = false;

  @override
  void initState() {
    super.initState();
    isloading = widget.isLoading;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Container(
        height: screenHeight - (100 + 160 + statusBarHeight + 24),
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Set the border radius
                                    child: Container(
                                      color: Color.fromRGBO(34, 145, 214,
                                          0.33), // set the background color here
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 45,
                                            left: 45,
                                            bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text('0',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            23, 183, 128, 1),
                                                        fontSize: 30))),
                                            Text('RECENT',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        221, 221, 221, 1),
                                                    fontSize: 16)),
                                            Text('Counts',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                    ))),
                            Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Set the border radius
                                    child: Container(
                                      color: Color.fromRGBO(34, 145, 214,
                                          0.33), // set the background color here
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 40,
                                            left: 40,
                                            bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 10),
                                                child: Text('4,605',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            224, 150, 11, 1),
                                                        fontSize: 30))),
                                            Text('RECENT',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        221, 221, 221, 1),
                                                    fontSize: 16)),
                                            Text('Counts',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ),
                                    ))),
                          ]),
                      Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(
                            children: [
                              Divider(
                                color: Colors.white,
                                height: 1,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 13, bottom: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Finish Later',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                    ],
                                  )),
                              Divider(
                                color: Colors.white,
                                height: 1,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 13, bottom: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Cancel Count',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                    ],
                                  )),
                              Divider(
                                color: Colors.white,
                                height: 1,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 13, bottom: 13),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Complete Count',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18)),
                                    ],
                                  )),
                              Divider(
                                color: Colors.white,
                                height: 1,
                              ),
                            ],
                          ))
                    ],
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom:
                                20), // or EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8)
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right:
                                        10), // or EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8)
                                child: Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 18,
                                  semanticLabel: 'Navigation Icon',
                                ),
                              ),
                              Text(
                                "SCAN AFTER SCAN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              )
                            ])),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          color: Color.fromRGBO(34, 145, 214, 1),
                        ),
                        child: LoadingBtn(
                          height: 50,
                          borderRadius: 50,
                          // animate: true,
                          color: Color.fromRGBO(34, 145, 214, 1),
                          width: (screenWidth - 80) / 2,

                          loader: Container(
                              padding: const EdgeInsets.all(10),
                              // child: const CircularProgressIndicator(
                              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              // ),
                              child:
                                  LoadingAnimationWidget.horizontalRotatingDots(
                                      color: Colors.white, size: 50)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "BROWSE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                              ]),
                          onTap: (startLoading, stopLoading, btnState) async {
                            if (btnState == ButtonState.idle) {
                              widget.setLoading(true);

                              // call your network api
                              await Future.delayed(const Duration(seconds: 1));

                              widget.setLoading(false);
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Color.fromRGBO(34, 145, 214, 1),
                        ),
                        child: LoadingBtn(
                          height: 50,
                          borderRadius: 50,
                          // animate: true,
                          color: Color.fromRGBO(34, 145, 214, 1),
                          width: (screenWidth - 80) / 2,

                          loader: Container(
                              padding: const EdgeInsets.all(10),
                              // child: const CircularProgressIndicator(
                              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              // ),
                              child:
                                  LoadingAnimationWidget.horizontalRotatingDots(
                                      color: Colors.white, size: 50)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "COUNT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                                )
                              ]),
                          onTap: (startLoading, stopLoading, btnState) async {
                            if (btnState == ButtonState.idle) {
                              widget.setLoading(true);

                              // call your network api
                              await Future.delayed(const Duration(seconds: 1));

                              widget.setLoading(false);
                            }
                          },
                        ),
                      ),
                    ]),
                  ])
                ])));
  }
}

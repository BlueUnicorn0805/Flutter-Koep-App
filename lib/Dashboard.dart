import 'package:flutter/services.dart';
import 'package:loading_btn/loading_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:test_app/Count.dart';

class DashboardScreen extends StatelessWidget {
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
          LocationCard(),
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
        height: 130,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 50,
                  color: Colors.white,
                ),
                Icon(
                  Icons.view_headline,
                  color: Colors.white,
                  size: 30,
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
    return Container(
        color: Colors.grey.withOpacity(0.3),
        height: 160,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Good Afternoon',
                        style: TextStyle(
                            color: Color.fromRGBO(221, 221, 221, 1),
                            fontSize: 22)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text('Eric',
                          style: TextStyle(color: Colors.white, fontSize: 32)),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(50), // Set the border radius
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 90,
                    height: 90,
                  ),
                )
              ],
            )));
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
        height: screenHeight - (130 + 160 + 50 + statusBarHeight + 24),
        color: Color.fromRGBO(0, 0, 0, 1),
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
                                padding: const EdgeInsets.only(top: 20),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Set the border radius
                                    child: Container(
                                      color: Color.fromRGBO(34, 145, 214,
                                          0.33), // set the background color here
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 24,
                                            right: 45,
                                            left: 45,
                                            bottom: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Icon(
                                                  Icons
                                                      .replay_circle_filled_outlined,
                                                  color: Color.fromRGBO(
                                                      34, 145, 214, 1),
                                                  size: 26,
                                                  semanticLabel: 'Recent Icon',
                                                )),
                                            Text('RECENT',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        221, 221, 221, 1),
                                                    fontSize: 18)),
                                            Text('Counts',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ))),
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Set the border radius
                                    child: Container(
                                      color: Color.fromRGBO(34, 145, 214,
                                          0.33), // set the background color here
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 24,
                                            right: 40,
                                            left: 40,
                                            bottom: 24),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 15),
                                                child: Icon(
                                                  Icons.play_circle_rounded,
                                                  color: Color.fromRGBO(
                                                      34, 145, 214, 1),
                                                  size: 26,
                                                  semanticLabel: 'Recent Icon',
                                                )),
                                            Text('RESUME',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        221, 221, 221, 1),
                                                    fontSize: 18)),
                                            Text('Count',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14)),
                                          ],
                                        ),
                                      ),
                                    ))),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Set the border radius
                                    child: Container(
                                      width: screenWidth - 40,
                                      height: 80,
                                      color: Color.fromRGBO(34, 145, 214,
                                          0.33), // set the background color here
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('START NEW COUNT',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          221, 221, 221, 1),
                                                      fontSize: 18)),
                                              Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.white,
                                                size: 16,
                                                semanticLabel: 'Recent Icon',
                                              )
                                            ],
                                          )),
                                    ))),
                          ]),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    LoadingBtn(
                      height: 50,
                      borderRadius: 50,
                      // animate: true,
                      color: Color.fromRGBO(34, 145, 214, 1),
                      width: 300,

                      loader: Container(
                          padding: const EdgeInsets.all(10),
                          // child: const CircularProgressIndicator(
                          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          // ),
                          child: LoadingAnimationWidget.horizontalRotatingDots(
                              color: Colors.white, size: 50)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right:
                                      10), // or EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8)
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 18,
                                semanticLabel: 'Navigation Icon',
                              ),
                            ),
                            Text(
                              "LOOKUP PRODUCT",
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
                          await Future.delayed(const Duration(seconds: 3));

                          widget.setLoading(false);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CountScreen()),
                          );
                        }
                      },
                    ),
                  ]),
                ])));
  }
}

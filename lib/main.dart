import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flu Board',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          children: [
            Page('Page 1', Colors.blue),
            Page('Page 1', Colors.red),
            Page('Page 1', Colors.green),
            Page('Page 1', Colors.yellow),
          ],
        ),
        Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(bottom: 40),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 4,
              effect: WormEffect(),
              onDotClicked: (index) => pageController.animateToPage(index,
                  duration: Duration(milliseconds: 3000),
                  curve: Curves.bounceInOut),
            ),
          ),
        )
      ],
    ));
  }

  Widget Page(String pageName, Color color) {
    return Container(
      padding: EdgeInsets.only(top: 90),
      color: color,
      child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            pageName,
            style: TextStyle(
                fontSize: 20,
                color: color != Colors.yellow ? Colors.white : Colors.black),
          )),
    );
  }
}

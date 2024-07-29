import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/Screens/todo_home_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyWidget())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Added some space between text and image
            Image.network(
              "https://cdn11.bigcommerce.com/s-5effd8vce/images/stencil/original/image-manager/tick11.png?t=1685693887",
              width: 200, // Reduced image size
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              "TASKPULSE",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24, // Increased font size
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

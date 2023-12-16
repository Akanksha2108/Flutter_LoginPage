import 'package:flutter/material.dart';
import 'package:akfirst/main.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
          backgroundColor: Colors.deepPurple,
          shadowColor: Colors.grey,
          title: const Text(
            "Ak",
            style: TextStyle(color: Colors.white, fontFamily: "mainfont"),
          )),
          body: Center(
            child: Container(
              child: "Congratulation !! Your login is Done"
              .text
              .xl3
              .color(Colors.deepPurple)
              .fontFamily("mainfont")
              .make(),
            ),
          ),
    );
  }
}

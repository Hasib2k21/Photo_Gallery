import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_gallery5/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                SystemNavigator.pop();
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          title: const Text("Photo Gallery"),
          titleTextStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              fontFamily: 'Poppins',
              letterSpacing: 0.5),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [],
              iconColor: Colors.white,
              iconSize: 32,
            )
          ],
          backgroundColor: const Color(0xFF2CAB00),
        ),
        body: const Home(),
      ),
    );
  }
}

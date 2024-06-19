import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fake_async/fake_async.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Football Image"),
            //Image.network("https://rukminim2.flixcart.com/image/850/1000/poster/w/j/v/wonder-images-football-lover-canvas-art-with-back-framing-original-imaef9dhgazsb7gz.jpeg?q=20&crop=false"),
            FadeInImage.assetNetwork(
                placeholder: "assets/images/loading.gif",
                image: "assets/images/football.jpg",
                height: 450),
            ElevatedButton(
              onPressed: () {
                print("Button pressed");
              },
              child: Text("Button"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

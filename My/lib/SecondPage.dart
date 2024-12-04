import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String message;

  SecondPage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hey, " + message,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.network(
                "https://rukminim2.flixcart.com/image/850/1000/poster/w/j/v/wonder-images-football-lover-canvas-art-with-back-framing-original-imaef9dhgazsb7gz.jpeg?q=20&crop=false",
            height: 700,),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

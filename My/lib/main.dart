import 'package:flutter/material.dart';
import 'package:practice/SecondPage.dart';
import 'package:practice/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String name = "";
  TextEditingController nameCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome !',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameCont,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                name = nameCont.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(message: name)),
                );
              },
              child: Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                name = nameCont.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => register()),
                );
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

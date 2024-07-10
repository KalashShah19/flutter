import 'dart:async';
import 'package:crud/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD',
      home: register(),
    );
  }
}

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  @override
  void initState() async {
    super.initState();
    final SharedPreferences s = await SharedPreferences.getInstance();
    if(s.getString("email") != Null || s.getString("email") != ""){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard()));
    }
  }

  TextEditingController nameCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passCont = new TextEditingController();

  final Future<SharedPreferences> s = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Here"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 15),
            TextField(
              controller: nameCont,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: emailCont,
              decoration: InputDecoration(
                labelText: "Enter Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),
            TextField(
              controller: passCont,
              decoration: InputDecoration(
                labelText: "Enter Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              obscureText: true,
              obscuringCharacter: "#",
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () async {
              setState(() async {
                String name = nameCont.text.toString();
                String email = emailCont.text.toString();
                String password = passCont.text.toString();

                final SharedPreferences s = await SharedPreferences.getInstance();
                s.setString("name", name);
                s.setString("email", email);
                s.setString("password", password);
                print("set");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              });
            }, child: Text("Create Account")),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            }, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
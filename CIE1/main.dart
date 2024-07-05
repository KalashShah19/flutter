import 'dart:async';

import 'package:cie1/dashboad.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "Home Page")));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Image.network("assets/images/budget.png"),
        // child: Text("Loading..."),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
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
  TextEditingController enroCont = new TextEditingController();
  TextEditingController nameCont = new TextEditingController();
  TextEditingController numberCont = new TextEditingController();
  TextEditingController dobCont = new TextEditingController();
  TextEditingController passCont = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Form"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Enter Details :"),
            TextField(
              controller: enroCont,
              decoration: InputDecoration(
                labelText: "Enrollment",
                hintText: "Enter Enrollment Number",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(19))
              ),
            ),
            SizedBox(height: 19,),
            TextField(
              controller: nameCont,
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter Name",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(19))
              ),
            ),
            SizedBox(height: 19,),
            TextField(
              controller: numberCont,
              decoration: InputDecoration(
                  labelText: "Mobile Number",
                  hintText: "Enter Mobile Number",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(19))
              ),
            ),
            SizedBox(height: 19,),
            TextField(
              controller: passCont,
              decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(19))
              ),
            ),
            SizedBox(height: 19,),
            TextField(
              controller: dobCont,
              decoration: InputDecoration(
                  labelText: "Date of Birth",
                  hintText: "Enter Date of Birth",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(19))
              ),
            ),
            SizedBox(height: 19,),
            ElevatedButton(onPressed: (){
              String name = nameCont.text;
              String enro = enroCont.text;
              String dob = dobCont.text;
              String number = numberCont.text;
              String password = passCont.text;
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login(name: name, enro: enro, dob:dob, number: number, password:password)));

            }, child: Text("Save")),
          ],
        )
        ,
      )
    );
  }
}

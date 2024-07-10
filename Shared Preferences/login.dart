import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  TextEditingController nameCont = new TextEditingController();
  TextEditingController emailCont = new TextEditingController();
  TextEditingController passCont = new TextEditingController();

  final Future<SharedPreferences> s = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
    child: Column(
    children: [
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
    ElevatedButton(onPressed: () {
      setState(() async {
        String name = nameCont.text.toString();
        String email = emailCont.text.toString();
        String password = passCont.text.toString();

        final SharedPreferences s = await SharedPreferences.getInstance();
        String? sName = s.getString("name");
        String? sEmail = s.getString("email");
        String? sPassword = s.getString("password");

        if(email == sEmail && password == sPassword) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
        }
        else{
          ScaffoldMessenger(
            child: Text("Login Failed"),
          );
        }
      });
    }, child: Text("Login")),
    SizedBox(height: 15),
    ElevatedButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
    }, child: Text("Register")),
    ],
    ),
    ),
    );
  }
}

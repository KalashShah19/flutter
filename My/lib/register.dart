import 'package:flutter/material.dart';
import 'package:practice/profile.dart';

import 'login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController Name = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register")
      ),
        body: Center(
          child: Column(
            children: [
              Text("Create Your Own Accoount"),
              TextField(
                controller: Name,
                decoration: InputDecoration(
                  hintText: "Enter Your Name",
                ),
              ),
              TextField(
                controller: Email,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                ),
              ),
              TextField(
                controller: Password,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                ),
              ),
              ElevatedButton(onPressed: (){
                name = Name.text;
                email = Email.text;
                password = Password.text;
                Navigator.push(context, MaterialPageRoute(builder: (context) => profile(Name: name, Email: email,Password: password,)),);
              }, child: Text("Register")
              )
            ],
          ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'login.dart';

class profile extends StatefulWidget {
  String Name;
  String Email;
  String Password;

  profile({required this.Name, required this.Email, required this.Password});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController password;

  void initState() {
    super.initState();
    name = TextEditingController(text: widget.Name);
    email = TextEditingController(text: widget.Email);
    password = TextEditingController(text: widget.Password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Profile")
      ),
      body: Center(
        child: Column(
          children: [
            Text("Edit"),
            SizedBox(height: 20,),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter Your Name",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => login()),);
            }, child: Text("Logout")
            )
          ],
        ),
      ),
    );
  }
}

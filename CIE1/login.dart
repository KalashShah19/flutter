import 'package:flutter/material.dart';

import 'dashboad.dart';

class login extends StatefulWidget {
  const login({ required this.name, required this.enro, required this.number, required this.dob, required this.password });

  final String name;
  final String enro;
  final String password;
  final String dob;
  final String number;

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController enroCont = new TextEditingController();
  late TextEditingController nameCont = new TextEditingController();
  late TextEditingController numberCont = new TextEditingController();
  late TextEditingController dobCont = new TextEditingController();
  late TextEditingController passCont = new TextEditingController();

  @override void initState() {
    enroCont = TextEditingController(text: widget.enro);
    nameCont = TextEditingController(text: widget.name);
    passCont = TextEditingController(text: widget.password);
    dobCont = TextEditingController(text: widget.dob);
    numberCont = TextEditingController(text: widget.number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Fill Credentials : "),
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
            ElevatedButton(onPressed: (){
              String name = nameCont.text;
              String enro = enroCont.text;
              String dob = dobCont.text;
              String number = numberCont.text;
              String password = passCont.text;

              Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard(name: name)));

            }, child: Text("Save")),
          ],
        )
      ),
    );
  }
}

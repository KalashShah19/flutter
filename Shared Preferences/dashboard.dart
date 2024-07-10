import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String sName = "";
  final Future<SharedPreferences> s = SharedPreferences.getInstance();

  @override
  void initState() {
    getName();
  }

  getName() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    sName = s.getString("name")!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome to Dashboard, " + sName),),
      body: Center(
        child: Text("Welcome " + sName),
      ),
    );
  }
}

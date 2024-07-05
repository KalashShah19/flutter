import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({ required this.name });
  final String name;

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  String name = "";
  @override void initState() {
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child:
        SingleChildScrollView(
          child:
        Column(
          children: [
            Container(
              color: Colors.grey,
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person, size: 50, ),
                  Center( child:
                  Column(
                    children: [
                      Text("Welcome"),
                      Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  )
                  ),
                  Icon(Icons.settings),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.blue,
              ),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.all(20)),
                SizedBox(height: 15,),
                Column(children: [
                  SizedBox(height: 15,),
                  Text("Total Balance", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(height: 15,),
                  Text("45500.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                  SizedBox(height: 55,),
                  Row(
                    children: [
                      Icon(Icons.arrow_circle_down, color: Colors.green, size: 35,),
                      Column(children: [
                        Text("Income", style: TextStyle(color: Colors.white),),
                        Text("\$62500.00", style: TextStyle(color: Colors.white),),
                      ],),
                      Icon(Icons.arrow_circle_up, color: Colors.red, size: 35,),
                      Column(children: [
                        Text("Expense", style: TextStyle(color: Colors.white),),
                        Text("\$17000.00", style: TextStyle(color: Colors.white),),
                      ],),
                    ],
                  ),
                ],),
              ],
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Categories", style: TextStyle(color: Colors.orange, fontSize: 25),),
                Text("Show All"),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black12,
              ),
              margin: EdgeInsets.all(25),
              child:
                  Center(
                    child:
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.tv, size: 30),
                    Text("Entertainment"),
                    Text("\$1000", style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.fastfood, size: 30),
                    Text("Food"),
                    Text("\$1500", style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.train, size: 30),
                    Text("Travel"),
                    Text("\$12500", style: TextStyle(color: Colors.red),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.shopping_bag, size: 30),
                    Text("Shopping"),
                    Text("\$2000", style: TextStyle(color: Colors.red),),
                  ],
                ),
                ElevatedButton(onPressed: (){}, child: Text("+"), style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),)
              ],
            ),
                  ),
            ),
          ],
        ),
      ),),
    );
  }
}

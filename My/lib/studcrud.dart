import 'package:flutter/material.dart';
import 'package:navigation_demo/SqlHelper.dart';
import 'package:sqflite/sqflite.dart';

class studcrud extends StatefulWidget {
  const studcrud({super.key});

  @override
  State<studcrud> createState() => _studcrudState();
}

class _studcrudState extends State<studcrud> {
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  List<Map<String,dynamic>> studList = [];
  void showForm(int? id) async{

    if(id != null)
      {
        final existingrecord = studList.firstWhere((element)=>element['id'] == id);
        txtName.text = existingrecord['name'];
        txtEmail.text = existingrecord['email'];
      }
    showModalBottomSheet(context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (context) => Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 120
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: txtName,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () async{
                if(id == null)
                  await AddStudent();
                else
                  await UpdateStudent(id);
                txtName.clear();
                txtEmail.clear();
                Navigator.of(context).pop();
              }, child: Text(id == null ? 'Create New' : 'Update'))
            ],
          ),
        ),

    );


  }

  Future<void> DeleteStudent(int id) async{
    await Sqlhelper.DeleteStudent(id);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Student Deleted Successfully')));
    GetStudents();
  }
  Future<void> UpdateStudent(int id) async{
    int result = await Sqlhelper.UpdateStudent(id, txtName.text.toString(), txtEmail.text.toString());
    if(result > 0)
      {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Student Updated Successfully')));
        GetStudents();
      }
  }
  Future<void> AddStudent() async{
    int id = await Sqlhelper.AddStudent(txtName.text.toString(), txtEmail.text.toString());
    if(id > 0)
    {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Student Added Successfully')));
      GetStudents();
    }
  }
  Future<void> GetStudents() async{
    var data = await Sqlhelper.GetStudentList();
    print(data);
    setState(() {
      studList = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetStudents();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Management System'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 5,
        onPressed: (){
          showForm(null);
        },
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          color: Colors.lightBlueAccent,
          child: ListTile(
            title: Text(studList[index]['name']),
            subtitle: Text(studList[index]['email']),
            trailing: Container(
              width: 100,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    showForm(studList[index]['id']);
                  }, icon: Icon(Icons.edit)),
                  IconButton(onPressed: () async{
                    await DeleteStudent(studList[index]['id']);
                  }, icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        );
      },itemCount: studList.length,),
    );
  }
}

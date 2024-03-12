import 'package:flutter/material.dart';
import 'package:flutter_application_1/Db/Functions/dbfunctions.dart';
import 'package:flutter_application_1/Db/model/datamodel.dart';

class addstudent extends StatefulWidget {
  const addstudent({super.key});

  @override
  State<addstudent> createState() => _addstudentState();
}

class _addstudentState extends State<addstudent> {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: agecontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    addstudentbuttonclicked();
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add student')),
              SizedBox(
                height: 500,
                width: 300,
                child: ValueListenableBuilder(
                  valueListenable: studentlistnotifier,
                  builder:
                      (BuildContext, List<studentmodel> studentlist, child) {
                    return ListView.separated(
                      itemCount: studentlist.length,
                      itemBuilder: (context, index) {
                        final data = studentlist[index];

                        return ListTile(
                          title: Text(data.name),
                          subtitle: Text(data.age),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addstudentbuttonclicked() async {
    final _name = namecontroller.text.trim();
    final _age = agecontroller.text.trim();
    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    print('$_name $_age');
    final student = studentmodel(name: _name, age: _age);
    twostudent(student);
  }
}

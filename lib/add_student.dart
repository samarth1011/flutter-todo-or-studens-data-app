import 'package:flutter/material.dart';
import 'package:net_ninja_quotes/QuoteList.dart';
import 'dart:convert';

class AddStudent extends StatefulWidget {
  final QuoteList? quoteList;
  AddStudent({this.quoteList});

  @override
  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Students'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(height: 6),
              AddNameForm(),
              SizedBox(height: 12),
              AddAgeForm(),
              SizedBox(height: 50),
              ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      print(myController.text);
                      if (myController.text.length != 0) {
                        Navigator.pop(context, {
                          'text_name': (myController.text) == ''
                              ? ''
                              : myController.text,
                          'text_age': int.parse(ageController.text)
                        });
                      }

                      myController.clear();
                      ageController.clear();
                      // myController.dispose();

                      // QuoteList()
                    });
                  },
                  icon: Icon(Icons.person_add_alt),
                  label: Text('Add Student')),
              SizedBox(height: 50),
            ],
          ),
        ));
  }
}

class AddNameForm extends StatefulWidget {
  @override
  _AddNameFormState createState() => _AddNameFormState();
}

final myController = TextEditingController();

class _AddNameFormState extends State<AddNameForm> {
  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        hintText: 'Student Name',
      ),
    );
  }
}

class AddAgeForm extends StatefulWidget {
  AddAgeForm({Key? key}) : super(key: key);

  @override
  _AddAgeFormState createState() => _AddAgeFormState();
}

final ageController = TextEditingController();

class _AddAgeFormState extends State<AddAgeForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: ageController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.info_outline),
        hintText: 'Age',
      ),
    );
  }
}

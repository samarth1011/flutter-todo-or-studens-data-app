import 'package:flutter/material.dart';
import 'package:net_ninja_quotes/quote.dart';

class QuoteList extends StatefulWidget {
  QuoteList({Key? key}) : super(key: key);

  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Student> studentList = [
    Student(Name: "Samarth", Age: 12),
    Student(Name: "Amol", Age: 45),
    Student(Name: "Ganesh", Age: 25)
  ];
  dynamic result = {'text_name': null, 'text_age': null};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Students Data'),
        centerTitle: true,
      ),
      body: Builder(builder: (context) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    QuoteCard(
                        student: studentList[index],
                        // add: () {
                        //   setState(() {
                        //     print("In add");
                        //     studentList.add(student);
                        //   });
                        // },
                        delete: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Student ${studentList[index].Name} deleted successfully')));
                          setState(() {
                            print("In delete");
                            studentList.remove(studentList[index]);
                          });
                        })
                  ],
                ),
              );
            },
            itemCount: studentList.length);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            dynamic result = await Navigator.pushNamed(context, '/addStudent');
            setState(() {
              studentList.add(Student(
                  Name: result!['text_name'], Age: result!['text_age']));
              print("added succefullly");
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Added succefullly')));
            });
          } catch (e) {
            // print("Kuch nahi hota bhai!! apka error ye tha $e");
          }
        },
        child: const Icon(Icons.add),
        // backgroundColor: Colors.green,
      ),
    );
  }
}

//  Navigator.push(context, MaterialPageRoute<void>(
//   builder: (BuildContext context) {
//     return Scaffold()
class QuoteCard extends StatelessWidget {
  final Student? student;
  final VoidCallback? delete;
  final VoidCallback? add;

  QuoteCard({this.student, this.add, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text('${this.student!.Name}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 6),
              Text('${student!.Age}'),
              SizedBox(height: 6),
              IconButton(onPressed: this.delete, icon: Icon(Icons.delete)),
            ],
          ),
        ));
  }
}

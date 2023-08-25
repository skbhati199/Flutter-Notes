import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NoteListScreen(),
    );
  }
}



class NoteListScreen extends StatefulWidget {
  @override
  _NoteListScreenState createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterNotes'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 2.0,
              child: ListTile(
                title: Text(
                  notes[index],
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNote() {
    showDialog(
      context: context,
      builder: (context) {
        String newNote = '';

        return AlertDialog(
          title: Text('Add a Note'),
          content: TextField(
            onChanged: (value) {
              newNote = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  notes.add(newNote);
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
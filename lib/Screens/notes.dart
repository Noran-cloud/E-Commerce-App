import 'package:flutter/material.dart';
import 'package:rwad2/DI/di.dart';
import 'package:rwad2/DataBase/DatabaseHelper.dart';
import 'package:rwad2/Screens/add_note.dart';
import 'package:rwad2/models/notes.dart';

class Notes_Screen extends StatefulWidget {
  const Notes_Screen({super.key});

  @override
  State<Notes_Screen> createState() => _NotesState();
}
   final db = locator<Databasehelper>();
   List<Notes> notes = [];
class _NotesState extends State<Notes_Screen> {
  

  @override
  void initState() {
    super.initState();
    //_loadNotes();
    setState(() {
      _loadNotes();
    });
  }

  _loadNotes() async {
    final data = await db.getNotes();
    setState(() {
      notes = data;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNote(index: notes.length))).then((_)=> _loadNotes()),
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 105, 143, 247),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 143, 247),
        leading: Icon(Icons.lightbulb,color: Colors.white,),
        title: Text('Notes App',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 23),),),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNote(index: index,))).then((_)=> _loadNotes()),
                  child: SizedBox( height: 90,
                    child: Card(
                      elevation: 4,
                      color: const Color.fromARGB(255, 255, 224, 84),
                      child: Center(child: ListTile(title: Text('${notes[index].title}',)))),
                  ));
              },
            ),
          ),
        ],
      ),
    );
  }
}

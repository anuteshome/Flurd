import 'package:flurd/Services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

 final  FirestoreService firestoreService=FirestoreService();
// Text controller
final TextEditingController textController = TextEditingController();

  void  OpenNotbox(){
    showDialog(
context: context,
builder: (context) => AlertDialog(content: TextField(controller: textController,),
actions: [
  ElevatedButton(onPressed:(){
    firestoreService.addNote(textController.text);

    textController.clear();

    Navigator.pop(context);
  } , child: Text("Add")),
],
)
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title:Text('Notes')),
        floatingActionButton:FloatingActionButton(
            onPressed:OpenNotbox,
            child: const Icon(Icons.add),
            
        ),
         body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          final notesList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = notesList[index];
              String docID = document.id;

              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;

              String noteText = data['note'];

              return ListTile(
                title: Text(noteText),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    firestoreService.deleteNote(docID);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/Pages/new_note/view.dart';

import '../../model/notes_model.dart';
import 'logic.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final logic = Get.put(NotesLogic());

  final state = Get.find<NotesLogic>().state;



  static List<NotesModel> _notesmodel=[
    NotesModel(
        category: 'jfds',
        title: 'SIBAH',
      createdAt: DateTime(66),

       )
  ];
  final _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "All notes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 29,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        elevation: 12,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => NewNotePage(),
              ));
        },
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  autocorrect: true,
                  cursorColor: Colors.white,
                  controller: _searchcontroller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(7.0),
                    fillColor: Colors.black45,
                    filled: true,

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    hintText: ("Search notes"),
                    hintStyle: TextStyle(color: Colors.white),
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.white),
                  )),
              SizedBox(height: 10,),
             SizedBox(
               height: 200,
               child: ListView.builder(
                 itemCount:_notesmodel.length ,
                 itemBuilder: (context, index) {
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Container(
                       height: 110,
                       width: 120,
                       decoration: BoxDecoration(
                         color: Colors.grey.shade700,
                         borderRadius: BorderRadius.circular(12.0),
                       ),
                       child:
                       Column(
                         children: [
                           Text(_notesmodel[index].title,
                             style: TextStyle(
                               fontSize: 24,
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                               fontStyle: FontStyle.normal,
                             )),

                           Row(
                             children: [
                               Icon(
                                 Icons.file_copy_outlined,
                                 size: 12,
                                 color: Colors.grey,
                               ),
                               Text(
                                 _notesmodel[index].category,
                                 style: TextStyle(
                                   fontSize: 15,
                                   color: Colors.grey,
                                   fontWeight: FontWeight.bold,
                                   fontStyle: FontStyle.normal,
                                 ),
                               ),
                             ],
                           ),

                         ],
                       ),
                     ),
                   );
                 },
               ),
             )
            ],),
          ),
        ),
      ),
    );
  }
}

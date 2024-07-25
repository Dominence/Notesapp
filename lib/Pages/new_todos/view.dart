import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/Pages/todos/view.dart';
import 'package:learn/model/notes_model.dart';

import '../../model/note_repository.dart';
import 'logic.dart';

class NewtodosPage extends StatelessWidget {
  NewtodosPage({Key? key}) : super(key: key);

  final logic = Get.put(NewtodosLogic());
  final state = Get.find<NewtodosLogic>().state;


  final _category = TextEditingController();
  final _title = TextEditingController();
  final _searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:15.0,top: 11,right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TodosPage(),));
                      },
                      child: Icon(Icons.close,color: Colors.black,)),
                ],
              ),
              SizedBox(height: 4,),
              SizedBox(height: 33,
                child: TextField(
                    controller: _searchcontroller,
                    autocorrect: true,
                    cursorColor: Color(0xffffffff),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 20),
                        fillColor:const Color(0xff2B2B2B),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2,
                                color: Colors.white38
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        border: InputBorder.none,
                        hintText: ("Add a to-do item"),
                        hintStyle: TextStyle(color: Colors.white,fontSize: 12),
                    )),
              ),
               BackButton(color: Colors.white,
               style: ButtonStyle(
                 iconSize: WidgetStatePropertyAll(18)
               ),
               onPressed: () {
                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TodosPage(),));
               },)
            ],
          ),
        ),
      ),
    );
  }
  _insertNotes(){
    final notesmodel=NotesModel(
        title: _title.text,
        category: _category.text,
        createdAt: DateTime.now());
    NoteRepository.insert(notesmodel: notesmodel);
  }
}

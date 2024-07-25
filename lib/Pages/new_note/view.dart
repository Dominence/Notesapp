import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/Pages/home/view.dart';
import 'package:intl/intl.dart';
import 'logic.dart';

class NewNotePage extends StatefulWidget {
  NewNotePage({Key? key}) : super(key: key);

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final logic = Get.put(New_noteLogic());

  final state = Get.find<New_noteLogic>().state;

  final _category = TextEditingController();
  final _title = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar:AppBar(backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15,),
          child:
          BackButton(
            color: Colors.white,
            style: ButtonStyle(elevation: WidgetStatePropertyAll(3),
                iconSize: WidgetStatePropertyAll(18)
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
            },),
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
          //   },
          //   icon: Icon(Icons.arrow_back_sharp,color: Colors.white,),
          //   style: ButtonStyle(
          //       shadowColor: MaterialStatePropertyAll(Colors.white54)),
          // ),
        ) ,
      ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),

            TextField(
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              controller: _title,
              decoration: InputDecoration(
                hintText: 'Title',
                  border: InputBorder.none,
                 hintStyle:TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Expanded(
              child: TextField(
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                controller: _category,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your note here',
                    hintStyle: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/Pages/new_note/view.dart';
import 'package:learn/Pages/notes/view.dart';
import 'package:learn/Pages/todos/view.dart';

import 'logic.dart';

// enum NavState { NOTES, TODOS }

class HomePage extends StatefulWidget {
  // static String get route => "/HomePage";

  static String get route => "/home";

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logic = Get.put(HomeLogic());

  final state = Get.find<HomeLogic>().state;

  List<Widget> pages = [NotesPage(),TodosPage()];

  int index = 0;
  // NavState _naviga = NavState.NOTES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.black,
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedFontSize: 15,
            unselectedFontSize: 14,
            showSelectedLabels: true,
            currentIndex: index,
            selectedItemColor: Colors.blue,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(
                color: Colors.white ,
                fontSize: 11, fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(
              color: Colors.blue,
              fontSize: 12,
            ),
            elevation: 4,
            onTap: (int value) {
              setState(() {
                index = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon:
                    // Icon(index == 0? Icons.notes_sharp : Icons.sticky_note_2_outlined,
                    // color:index == 0 ? Colors.white : Colors.blue,
                    // size: 22,),
                AnimatedContainer(
                  curve: Curves.decelerate,
                  duration: Duration(
                    microseconds: 2,
                  ),
                  child: Icon(
                    index == 0?  Icons.sticky_note_2_outlined: Icons.notes_sharp ,
                    size: index == 0 ? 30 : 20,
                    color: index == 0 ? Colors.blue : Colors.white,
                  ),
                ),
                label: "Notes",
                backgroundColor: Colors.black38,
              ),
              BottomNavigationBarItem(
                  icon:
                      // Icon(  index==1? Icons.task_alt_outlined: Icons.task_alt_rounded,
                      // size: 21,
                      // color: index ==1? Colors.blue : Colors.white,),
                  AnimatedContainer(

                      duration: Duration(microseconds: 3),
                      curve: Curves.decelerate,
                      child: Icon(
                       index==1? Icons.task_alt_outlined: Icons.task_alt_rounded,
                        color: index == 1 ? Colors.blue : Colors.white,
                        size: index == 1 ? 30 : 20,
                      )),
                  label: "To-dos",
                  ),
            ]),
        body: pages[index]);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/Pages/new_todos/view.dart';
import 'package:learn/model/todos_model.dart';
import 'logic.dart';

class TodosPage extends StatefulWidget {

  TodosPage({Key? key,  }) : super(key: key);

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  final logic = Get.put(TodosLogic());
  bool isDone=false;
  final state = Get.find<TodosLogic>().state;
   List<Todo> todos=[
  Todo(todo: 'Learn How to do  clickble Index',id: '01'),
  Todo(todo: 'Learn how to transfer data',id: '02', isDone: true),
  Todo(todo: 'Learn cart menu', id: '03'),
  Todo(todo: 'Play chess with Kitty chess', id: '04'),
  Todo(todo: 'Learn How to do  kitkat', id: '05',isDone: true),
  ];
  final _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "To-dos",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 29,
          ),
        ),
      ),
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
                builder: (context) => NewtodosPage(),
              ));
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal:20.0),
              child:
              SizedBox(
                height: 40,
        
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
                        borderRadius: BorderRadius.circular(28)
                      ),
                      border: InputBorder.none,
                      hintText: ("Search to-dos"),
                      hintStyle: TextStyle(color: Colors.white,fontSize: 12),
                         prefixIcon: Icon(Icons.search,size: 18,color: Colors.white,)
                    )),
              ),
            ),
        SizedBox(
          height: Get.height,
          child: ListView.builder(
             itemCount: todos.length,
        
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) =>
             Container(
              // margin: EdgeInsets.only(bottom: 3),
              color: Colors.black.withOpacity(0.8),
              child: ListTile(
                onTap: () {
                  setState(() {
                    isDone = !isDone;
                  });
                },
                leading: Icon(
                  isDone?
                  Icons.radio_button_on: Icons.radio_button_off,
                  color: Colors.grey,
                ),
                title: Text(
              todos[index].todo,
                  style: TextStyle(
                      decoration: isDone? TextDecoration.lineThrough : null,
                      color: Colors.grey.shade700,
                      fontSize: 18),
                ),
              ),),
          ),
        )
          ],
        ),
      ),
    );
  }
}

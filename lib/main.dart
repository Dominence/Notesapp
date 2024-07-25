import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/Pages/home/view.dart';
import 'package:learn/Pages/notes/view.dart';
import 'package:learn/Pages/todos/view.dart';

// import 'Pages/utils/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

       getPages:
       // getpage,
       [
         GetPage(name: "/home", page:() => HomePage(),),
         GetPage(name: '/note', page: () =>NotesPage()),
         GetPage(name: '/note', page: () =>TodosPage()),
       ],
       initialRoute: HomePage.route,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

    );
  }
}

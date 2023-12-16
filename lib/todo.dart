import 'package:flutter/material.dart';
import 'package:demo1/widgets/todo_items.dart';
import 'package:demo1/todo.dart';
import 'package:demo1/model/to_do.dart' as classToDo;

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {

 List<todo_item> todoList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 213, 221),
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            searchBox(),
            Container(
              height: 1000,
              width: 1000,
              child: ListView.builder(
                itemCount: classToDo.ToDo.todoList().length ,
          itemBuilder: (BuildContext context, int index) {
               // todo_item();
            print(classToDo.ToDo.todoList().length); 
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            );
          }
            ),
              )
              // ListView(
              //   children: [
              //     Container(
              //       margin: EdgeInsets.only(top: 50, bottom: 20),
              //       child: Text(
              //         'All ToDos',
              //         style: TextStyle(
              //           fontSize: 30,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ),

              //    // for( ToDo todo_item in todoList)
              //     //todo_item(),
              //    for(var item in classToDo.ToDo.todoList())
              //    {
              //     todo_item();
              //    } 
              //   ],
              // ),
            
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 212, 213, 221),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assests/P.jpeg'),
            ),
          ),
        ],
      ),
    );
  }
}

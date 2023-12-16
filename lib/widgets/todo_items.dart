import 'package:flutter/material.dart';

class todo_item extends StatelessWidget {
  const todo_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
        child: ListTile(
            onTap: () {
              print('clicked on Todo Item.');
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)
                ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),

            leading: Icon(
              Icons.check_box,
              color: Color.fromARGB(122, 134, 93, 231),
            ),
            title: Text(
              'Check Mail',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.lineThrough),
            ),
            trailing: Container(
              padding: EdgeInsets.all(0),
              
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 19, 19),
                borderRadius: BorderRadius.circular(5)
              ),
              child: IconButton(
                color: Colors.white,
                iconSize: 16,
                icon: Icon(Icons.delete),
                onPressed: () {
                  print('Clicked on delete button');
                },
              ),
            ),
            )
            );
  }
}

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rikku's Mix List"),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("pressed Mix List");
                    },
                    child: Text('Mix List'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("pressed Item 1");
                    },
                    child: Text('Item 1'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      print("pressed Item 2");
                    },
                    child: Text('Item 2'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

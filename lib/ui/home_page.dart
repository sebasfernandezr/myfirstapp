import "package:flutter/material.dart";
import 'package:flutter_myfirsapp_balcoder/ui/second_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myName = "Mi nombre es:";
  int count = 0;
  double decimalnumber = 4.5;
  bool myBool = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print(_width);
    print(_height);
    return Scaffold(
      appBar: AppBar(
        title: Text("ESTE ES EL TITULO"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Text(
              count.toString(),
              style: TextStyle(color: Colors.brown, fontSize: 28.0),
            )),
            GestureDetector(
              onTap: () {
                print("ONTAP");
                setState(() {
                  myBool = !myBool;
                });
              },
              child: Container(
                  height: _height * 0.5,
                  width: _width * 0.5,
                  color: myBool
                      ? Colors.green
                      : count > 2
                          ? Colors.blue
                          : Colors.red),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_){
                      return SecondPage();
                    }));



                  },
                  child: Container(
                      height: _height * 0.1,
                      width: _width * 0.1,
                      color: Colors.indigo),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("UNDIMOS ESTO");
          setState(() {
            count = count + 1;
            print(count);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

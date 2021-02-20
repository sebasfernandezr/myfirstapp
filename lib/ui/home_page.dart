import "package:flutter/material.dart";
import 'package:flutter_myfirsapp_balcoder/ui/user/dashboard_widget.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/model/usermodel.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/user_form_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myName = "Mi nombre es:";
  int count = 0;
  double decimalnumber = 4.5;
  bool myBool = true;
  List<UserModel> _userList = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    print(_width);
    print(_height);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
                child: Text(
              count.toString(),
              style: TextStyle(color: Colors.brown, fontSize: 28.0),
            )),
            DashboardWidget(count: _userList.length, title: "Usuarios"),
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
                      ? Colors.grey[200]
                      : count > 2
                          ? Colors.blue
                          : Colors.red),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (_) {
            return UserFomPage(
              userList: _userList,
            );
          }));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

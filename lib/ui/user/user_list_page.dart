import "package:flutter/material.dart";
import 'package:flutter_myfirsapp_balcoder/ui/user/dashboard_widget.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/model/usermodel.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/user_form_page.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  int count = 0;
  List<UserModel> _userList = [];
  int _currentIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de usuarios"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Center(
                    child: DashboardWidget(
                        count: _userList.length, title: "Usuarios")),
                Container(
                  color: Colors.red,
                  height: _height * 0.5,
                  width: _width,
                  child: ListView.builder(
                      itemCount: _userList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            onTap: () async {
                              //AL PRESIONAR EL USER, ASIGNA LAS VARIABLES A LOS CONTROLADORES
                              setState(() {
                                _currentIndex = index;
                              });
                              await Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return UserFomPage(
                                    userList: _userList,
                                    currentIndex: _currentIndex);
                              }));
                              setState(() {
                                _currentIndex = null;
                              });
                            },
                            leading: Icon(Icons.person),
                            title: Text(_userList[index].name),
                            subtitle:
                                Text(_userList[index].phoneNumber.toString()),
                            /*Eliminar*/
                            trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _userList.removeAt(index);
                                  });
                                },
                                child: Icon(Icons.delete)));
                      }),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _currentIndex = null;
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

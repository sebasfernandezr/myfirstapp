import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/model/usermodel.dart';

class UserFomPage extends StatefulWidget {
  UserFomPage({this.data});
  String data;

  @override
  _UserFomPageState createState() => _UserFomPageState();
}

class _UserFomPageState extends State<UserFomPage> {
  TextEditingController _cName = TextEditingController();
  TextEditingController _cPhoneNumber = TextEditingController();
  UserModel _userModel = new UserModel();
  List<UserModel> _userList = [];

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    print(widget.data);
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                controller: _cName,
                decoration: InputDecoration(
                    icon: Icon(Icons.account_circle_rounded),
                    hintText: "Ingrese su nombre"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _cPhoneNumber,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_android),
                    hintText: "Ingrese su celular"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (currentIndex != null) {
                    _userModel = _userList[currentIndex];
                    _userModel.name = _cName.text;
                    _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

                    _userList.removeAt(currentIndex);

                    setState(() {
                      _userList.add(_userModel);
                    });
                  } else {
                    //LOGICA
                    _userModel.name = _cName.text;
                    _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

                    print(_userModel.name);
                    print(_userModel.phoneNumber);

                    setState(() {
                      _userList.add(_userModel);
                    });

                    _userModel = new UserModel();
                  }

                  //reseteadores
                  _cName.text = "";
                  _cPhoneNumber.text = "";
                  currentIndex = null;
                },
                child: Container(
                  child: Center(
                      child: Text(
                    /*if terciario, si existe el botón actualiza si no, guarda*/
                    currentIndex != null ? "Actualizar" : "Guardar",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )),
                  height: _height * 0.05,
                  width: _width * 0.24,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              ),
            ),
            Container(
                width: _width * 0.8,
                height: _height * 0.4,
                color: Colors.grey[200],
                child: ListView.builder(
                    itemCount: _userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          /*Actualizar*/
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                              _cName.text = _userList[index].name;
                              _cPhoneNumber.text =
                                  _userList[index].phoneNumber.toString();
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
                    }))
          ],
        ),
      ),
    );
  }
}

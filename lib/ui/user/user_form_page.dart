import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/model/usermodel.dart';

class UserFomPage extends StatefulWidget {
  UserFomPage({this.userList});

  List<UserModel>userList;

  @override
  _UserFomPageState createState() => _UserFomPageState();
}

class _UserFomPageState extends State<UserFomPage> {
  TextEditingController _cName = TextEditingController();
  TextEditingController _cPhoneNumber = TextEditingController();
  UserModel _userModel = new UserModel();

  int currentIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
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
                    labelText: "Ingrese su nombre",
                    icon: Icon(Icons.account_circle_rounded),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _cPhoneNumber,
                decoration: InputDecoration(
                    icon: Icon(Icons.phone_android),
                    labelText: "Ingrese su celular"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _userModel.name = _cName.text;
                  _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

                  if (currentIndex != null) {
                    //LA ACTUALIZACIÓN
                    setState(() {
                      widget.userList[currentIndex] = _userModel;
                    });
                  } else {
                    //LA CREACIÓN
                    setState(() {
                      widget.userList.add(_userModel);
                    });
                  }

                  //reseteadores
                  _userModel = new UserModel();
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
                width: _width * 0.9,
                height: _height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListView.builder(
                    itemCount: widget.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          onTap: () {
                            //AL PRESIONAR EL USER, ASIGNA LAS VARIABLES A LOS CONTROLADORES
                            setState(() {
                              currentIndex = index;
                              _cName.text = widget.userList[index].name;
                              _cPhoneNumber.text =
                                  widget.userList[index].phoneNumber.toString();
                            });
                          },
                          leading: Icon(Icons.person),
                          title: Text(widget.userList[index].name),
                          subtitle:
                              Text(widget.userList[index].phoneNumber.toString()),
                          /*Eliminar*/
                          trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.userList.removeAt(index);
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

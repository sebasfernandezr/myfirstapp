import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/model/usermodel.dart';

class UserFomPage extends StatefulWidget {
  UserFomPage({this.userList, this.currentIndex});
  int currentIndex;

  List<UserModel> userList;

  @override
  _UserFomPageState createState() => _UserFomPageState();
}

class _UserFomPageState extends State<UserFomPage> {
  TextEditingController _cName = TextEditingController();
  TextEditingController _cPhoneNumber = TextEditingController();
  UserModel _userModel = new UserModel();

  @override
  void initState() {
    super.initState();

    if (widget.currentIndex != null) {
      _cName.text=widget.userList[widget.currentIndex].name;
      _cPhoneNumber.text=widget.userList[widget.currentIndex].phoneNumber.toString();
    }
  }

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

                  if (widget.currentIndex != null) {
                    //LA ACTUALIZACIÓN
                    setState(() {
                      widget.userList[widget.currentIndex] = _userModel;
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
                  widget.currentIndex = null;
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                      child: Text(
                    /*if terciario, si existe el botón actualiza si no, guarda*/
                    widget.currentIndex != null ? "Actualizar" : "Guardar",
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
          ],
        ),
      ),
    );
  }
}

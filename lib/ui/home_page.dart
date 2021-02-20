import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/product/product_list_page.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/user_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: (Text("Home Page"))),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return UserListPage();
                  }));
                },
                child: Center(
                  child: Container(
                    width: _width * 0.4,
                    height: _height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 15.0,
                              offset: Offset(0.0, 0.75))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(
                          Icons.account_box_rounded,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          "Usuarios",
                          style: TextStyle(
                              color: Colors.grey[300], fontSize: 18.0),
                        )),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ProductListPage();
                  }));
                },
                child: Center(
                  child: Container(
                    width: _width * 0.4,
                    height: _height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 8.0,
                              offset: Offset(0.0, 0.75))
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Spacer(),
                        Icon(
                          Icons.shopping_bag,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          "Productos",
                          style: TextStyle(
                              color: Colors.grey[300], fontSize: 18.0),
                        )),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

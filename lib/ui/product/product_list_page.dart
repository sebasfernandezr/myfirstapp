import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/product/model/product_model.dart';
import 'package:flutter_myfirsapp_balcoder/ui/product/product_form_page.dart';
import 'package:flutter_myfirsapp_balcoder/ui/user/dashboard_widget.dart';

class ProductListPage extends StatefulWidget {
  

  

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  
  int count = 0;
  List<ProductModel> _productList = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de productos"),
      ),
      body: Container(
        child: Column(
          children: [
            Spacer(),
            Center(
              child: DashboardWidget(
                count: _productList.length,
                title: "Productos",
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      
       floatingActionButton: FloatingActionButton(
        onPressed: () async {
           await Navigator.push(context,
                        MaterialPageRoute(builder: (_) {
                      return ProductFormPage(
                        productList: _productList,
                      );
                    }));
                    setState(() {});
                  },
        child: Icon(Icons.add),
      ),
    );
  }
}

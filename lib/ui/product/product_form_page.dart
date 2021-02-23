import 'package:flutter/material.dart';
import 'package:flutter_myfirsapp_balcoder/ui/product/model/product_model.dart';

class ProductFormPage extends StatefulWidget {
 
  ProductFormPage({this.productList});
  List<ProductModel> productList;
  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  TextEditingController _cKey = TextEditingController();
  TextEditingController _cPrice = TextEditingController();
  TextEditingController _cNameProduct = TextEditingController();
  TextEditingController _cNameProvider = TextEditingController();
  ProductModel _productModel = new ProductModel();
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulario de producto"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                  controller: _cKey,
                  decoration: InputDecoration(
                    labelText: "Ingrese la key del producto",
                    icon: Icon(Icons.vpn_key),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                  controller: _cPrice,
                  decoration: InputDecoration(
                    labelText: "precio del producto",
                    icon: Icon(Icons.attach_money),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                  controller: _cNameProduct,
                  decoration: InputDecoration(
                    labelText: "Nombre del producto",
                    icon: Icon(Icons.shopping_bag),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 12.0),
              child: TextFormField(
                  controller:_cNameProvider,
                  decoration: InputDecoration(
                    labelText: "Ingrese el provedor del producto",
                    icon: Icon(Icons.label),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  _productModel.key = _cKey.text;
                  _productModel.price = int.parse(_cPrice.text);
                  _productModel.nameProduct = _cNameProduct.text;
                  _productModel.nameProvider = _cNameProvider.text;
                  

                  if (currentIndex != null) {
                    //LA ACTUALIZACIÓN
                    setState(() {
                      widget.productList[currentIndex] = _productModel;
                    });
                  } else {
                    //LA CREACIÓN 
                    setState(() {
                      widget.productList.add(_productModel);
                    });
                  }

                  //reseteadores
                  _productModel = new ProductModel();
                  _cKey.text = "";
                  _cPrice.text ="" ;
                  _cNameProduct.text= "";
                  _cNameProvider.text = "";
                  currentIndex = null;
                  Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}

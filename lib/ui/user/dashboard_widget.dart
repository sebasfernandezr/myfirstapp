import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {

  DashboardWidget({this.count,this.title});
  int count;
  String title;
  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 240,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: [
          Spacer(),
          Text(widget.count.toString(),
              style: TextStyle(color: Colors.grey[200], fontSize: 32.0)),
          Spacer(),
          Text(widget.title,
              style: TextStyle(color: Colors.grey[200], fontSize: 24.0)),
          Spacer()
        ],
      ),
    );
  }
}

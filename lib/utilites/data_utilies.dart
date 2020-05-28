import 'package:flutter/material.dart';




Widget loading( ) => Container(
  padding: EdgeInsets.all(8),
  child: CircularProgressIndicator(),
) ;

Widget errorConnection() => Container(
  padding: EdgeInsets.all(8),
  child: Text("error Connection"),
);
Widget errorSnapshot(var error) {
  return Container(
    padding: EdgeInsets.all(8),
    child: Text("${error.toString()}"),
  ) ;
}

Widget errorNoData() {
  return Container(
    padding: EdgeInsets.all(8),
    child: Text(" No Data "),
  ) ;
}


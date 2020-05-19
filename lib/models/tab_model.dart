import 'package:flutter/material.dart';


class TabModel
{
  String _title ;
  String _describtion ;
  Color _color;

  TabModel(this._title, this._describtion, this._color);

  Color get color => _color;

  String get describtion => _describtion;

  String get title => _title;


}
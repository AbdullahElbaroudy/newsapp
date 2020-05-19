

import 'package:flutter/material.dart';

class PageModel
{
  String _image ;
  IconData _icon ;
  String _title;
  String _description  ;

  PageModel(this._image, this._icon, this._title, this._description);

  String get description => _description;

  String get title => _title;

  IconData get icon => _icon;

  String get image => _image;

  set description(String value) {
    _description = value;
  }

  set title(String value) {
    _title = value;
  }

  set icon(IconData value) {
    _icon = value;
  }

  set image(String value) {
    _image = value;
  }


}
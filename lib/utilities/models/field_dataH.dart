import 'package:flutter/foundation.dart';
import 'package:pathapp/utilities/models/field.dart';
import 'dart:collection';

class FieldDataH extends ChangeNotifier{
  List<Field> _fields=[
    Field(name: 'Perseverante'),
    Field(name: 'Perfeccionista'),
    Field(name: 'Influyente'),
    Field(name: 'Decidida'),
    Field(name: 'Lider'),
  ];

  int get taskCount{
    return _fields.length;
  }

  UnmodifiableListView<Field> get fields{
    return UnmodifiableListView(_fields);
  }

  void updateField(Field field, int value){
    field.changeGrade(value);
    notifyListeners();
  }

}
import 'package:flutter/foundation.dart';

class AppProvider extends ChangeNotifier{
  String? _nikName;
  String? _name;
  String? _firstName;
  String? _age;
  String? _sex;

  bool _isSaveUzbek =false;
  bool _isSaveTranslite =false;

  bool get isSaveUzbek => _isSaveUzbek;

  void isSaveUzbekBool(context){
    _isSaveUzbek=!_isSaveUzbek;
    notifyListeners();
  }


  bool get isSaveTranslite => _isSaveTranslite;

  void isSaveTransliteBool(context){
    _isSaveTranslite=!_isSaveTranslite;
    notifyListeners();
  }

  String? get nikName => _nikName;

  void nikNameText(String newText) {
    _nikName = newText;
    notifyListeners();
  }



  String? get name => _name;

  void firstNameText(String newText) {
    _firstName = newText;
    notifyListeners();
  }

  String? get firstName => _firstName;

  void nameText(String newText) {
    _name = newText;
    notifyListeners();
  }


  String? get age => _age;

  set age(String? value) {
    _age = value;
    notifyListeners();
  }

  String? get sex => _sex;

  set sex(String? value) {
    _sex = value;
    notifyListeners();
  }

}
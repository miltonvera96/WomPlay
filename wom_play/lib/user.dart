import 'package:flutter/cupertino.dart';

class User with ChangeNotifier{

  int puntos = 0;
  int edad = 0;
  String nombre ="";
  String sexo = "";
  String categoria ="";

  Map<String, List<String>> progress = {
    "Resolución de conflictos" : [
    ]
  };

  Map<String, double> categoriasrespondidas ={
    "Competidor": 0,
    "Concesivo": 0,
    "Elusivo": 0,
    "Colaborador": 0,
    "Complaciente":0
  };


  void completeLevel(String skill, String level){
    progress[skill].add(level);
    notifyListeners();
  }

  void addPoints(int points){
    puntos = puntos + points;
    notifyListeners();
  }

  void addCategoria(String categoria){
    categoriasrespondidas[categoria]++;

    updateCategoria();
  }

  void updateCategoria(){
    double greater = 0;
    for( String key in categoriasrespondidas.keys){
      if (categoriasrespondidas[key] > greater){
        greater = categoriasrespondidas[key];
        categoria = key;
      }
    }

    notifyListeners();
  }
}
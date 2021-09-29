import 'package:flutter/material.dart';
import 'package:mvp_app_aluguel_bikes/Models/bike.dart';

class CartItem with ChangeNotifier {
  List<Bike> _bikes = [];
  List<Bike> get bikes => [..._bikes];

  int get total => _bikes.length;

  String texto = "";
  double valor = 0;

  void addBike(Bike bike) {
    _bikes.add(bike);
    notifyListeners();
  }

  Validar(Bike bike) {
    if (!_bikes.contains(bike)) {
      addBike(bike);
      texto = "Otima escolha";
    } else{
      texto = "Item já relacionado no carrinho";
    }
    return texto;
  }

  void removeBike(Bike bike) {
    _bikes.remove(bike);
    notifyListeners();
  }

  void sumPrince(Bike bike) {
    valor += bike.preco;
    notifyListeners();
  }

  void mPrince(Bike bike) {
    valor -= bike.preco;
    notifyListeners();
  }


}

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:udemytest/models/cart.dart';
import 'package:udemytest/util/db_helper.dart';

class cartProvider with ChangeNotifier {
  DBHelper db = DBHelper();
  int _counter = 0;
  int get counter => _counter;
  double _totalPrice = 0;
  double get totalprice => _totalPrice;

  late Future<List<Cart>> _cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>> getData() async {
    _cart = db.getCartList();
    return _cart;
  }

  void _setprefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getprefItem() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter = prefs.getInt('cart_item') ?? 0;
    _totalPrice = prefs.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCounter() {
    _counter++;
    _setprefItem();
    notifyListeners();
  }

  void removeCounter() {
    _counter--;
    _setprefItem();
    notifyListeners();
  }

  int getCounter() {
    _getprefItem();
    return _counter;
  }

  void addTotalPrice(double price) {
    _totalPrice = _totalPrice + price;
    _setprefItem();
    notifyListeners();
  }

  void removeTotalPrice(double price) {
    _totalPrice = _totalPrice - price;
    _setprefItem();
    notifyListeners();
  }

  double getTotalPrice() {
    _getprefItem();
    return _totalPrice;
  }
}

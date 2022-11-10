import 'package:flutter/material.dart';
import '../data/list_menu.dart';
import '../data/model/menu.dart';

class Marketing with ChangeNotifier {
  List<CoffeMenu> badgeList = [];

  ListMenu list = ListMenu();

  Future<List<CoffeMenu>> getMenu() async {
    return list.listMenu;
  }

  void buyNot(CoffeMenu cofee){
    cofee.isBuy=!cofee.isBuy;
  }

  void changBadgeCount(CoffeMenu cofee) {
    if (cofee.isBuy) {
      badgeList.add(cofee);
      notifyListeners();
    } else {
      badgeList.remove(cofee);
      notifyListeners();
    }
  }

  List<CoffeMenu> getBadge() {
    return badgeList;
  }

  void clearBadge() {
    badgeList.clear();
    list.listMenu.forEach((element) {
      element.isBuy = false;
    });
    notifyListeners();
  }
}

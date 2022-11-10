import 'model/menu.dart';

class ListMenu{


  List<CoffeMenu> listMenu=<CoffeMenu>[
    CoffeMenu('latte.jpg','Латте' , 80),
    CoffeMenu('latte_grusha.jpg','Латте груша' , 100),
    CoffeMenu('malina_kokos.jpg','Раф малина-кокос' , 100),
    CoffeMenu('raf.jpg','Раф' , 100),
  ];

  Future<List<CoffeMenu>> getListMenu()async{
   return listMenu;
 }

}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';
import 'package:simple_state_management_shop/ui/my_home_page.dart';
import 'business/marketing.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Marketing>(
        create: (_) => Marketing(),
        child: OKToast(
          textStyle: const TextStyle(fontSize: 19.0, color: Colors.white),
          backgroundColor: Color.fromARGB(113, 145, 148, 139),
          position: ToastPosition.bottom,
          textPadding: EdgeInsets.all(8),
          duration: Duration(seconds: 3),
          child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Кофешоп'),
          ),
        ));
  }
}
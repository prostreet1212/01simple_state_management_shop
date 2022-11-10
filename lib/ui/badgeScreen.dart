import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:simple_state_management_shop/business/marketing.dart';
import 'package:provider/provider.dart';

class BadgeScreen extends StatelessWidget {
  BadgeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: context.read<Marketing>().badgeList.length == 0
          ? Center(
              child: Text(
                'Корзина пуста',
                style: TextStyle(fontSize: 24),
              ),
            )
          : Column(
              children: [
                Expanded(
                    flex: 12,
                    child: ListView.builder(
                        itemCount: context.read<Marketing>().badgeList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.yellow,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 200,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/${context.read<Marketing>().badgeList[index].image}',
                                    fit: BoxFit.fitWidth,
                                  ),
                                  Expanded(
                                      child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          context
                                              .read<Marketing>()
                                              .badgeList[index]
                                              .name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        Text(
                                            'Цена: ${context.read<Marketing>().badgeList[index].price} руб.',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16))
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        })),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                      child: Text(
                        'Оформить заказ',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      onPressed: () {
                        context.read<Marketing>().clearBadge();
                        //badgeList.clear();
                        Navigator.pop(context);
                        showToast('Заказ успешно выполнен');
                      },
                    ),
                  ),
                )
              ],
            ),
    );
  }
}

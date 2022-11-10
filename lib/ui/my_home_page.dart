import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_state_management_shop/ui/badgeScreen.dart';
import '../business/marketing.dart';


class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 172, 255, 191),
      appBar: AppBar(
        title: Text(title),
        leading: Consumer<Marketing>(builder: (context, state, child) {
          return
            Badge(
            badgeContent: Text('${context.watch<Marketing>().badgeList.length}'),
            position: const BadgePosition(start: 26, bottom: 26),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return BadgeScreen(
                    );
                  }),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          );
        }),
      ),
      body: FutureBuilder(
          future: context.read<Marketing>().getMenu(),
          builder: (context, snapshot) {
            var listMenu = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Center(
                    child: Text('Ошибка загрузки'),
                  );
                } else {
                  return GridView.count(
                      shrinkWrap: true,
                      //primary: false,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      crossAxisCount: 2,
                      children: listMenu!.map(
                            (menu) {
                          return Card(
                            color: Color.fromARGB(255, 255, 229, 85),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Wrap(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15)),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        'assets/images/${menu.image}',
                                        fit: BoxFit.fitWidth,
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          alignment: Alignment.center,
                                          color: Color.fromARGB(
                                              255, 174, 206, 231),
                                          height: 40,
                                          width: 40,
                                          child: Consumer<Marketing>(
                                              builder: (context, state, child) {
                                                return IconButton(
                                                  icon: Icon(
                                                    Icons.shopping_basket,
                                                    color: !menu.isBuy
                                                        ? Colors.grey
                                                        : Colors.red,
                                                  ),
                                                  onPressed: () {
                                                    context
                                                        .read<Marketing>().buyNot(menu);
                                                    context
                                                        .read<Marketing>()
                                                        .changBadgeCount(menu);
                                                  },
                                                );
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      menu.name,
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Text('Цена: '),
                                        Text(
                                          '${menu.price} руб.',
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ).toList());
                }
              default:
                return Container();
            }
          }),
    );
  }
}
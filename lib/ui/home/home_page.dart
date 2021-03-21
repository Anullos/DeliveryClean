import 'package:delivery_thema/ui/home/pages/cart/cart_page.dart';
import 'package:delivery_thema/ui/home/pages/product/products_page.dart';
import 'package:delivery_thema/ui/home/pages/profile/profile_page.dart';
import 'package:delivery_thema/ui/home/widgets/navegation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: [
                ProductsPage(),
                Text('currentIndex: $currentIndex'),
                CartPage(
                  onShopping: () {
                    setState(() {
                      currentIndex = 0;
                    });
                  },
                ),
                Text('currentIndex: $currentIndex'),
                ProfilePage(),
              ],
            ),
          ),
          NavigationBar(
              index: currentIndex,
              onIndexSelected: (index) {
                setState(() {
                  currentIndex = index;
                });
              }),
        ],
      ),
    );
  }
}

import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/ui/home/home_controller.dart';
import 'package:delivery_thema/ui/home/pages/cart/cart_page.dart';
import 'package:delivery_thema/ui/home/pages/product/products_page.dart';
import 'package:delivery_thema/ui/home/pages/profile/profile_page.dart';
import 'package:delivery_thema/ui/home/widgets/navegation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      )..loadUser(),
      builder: (_, __) => HomePage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeController>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: bloc.indexSelected,
              children: [
                ProductsPage(),
                const Placeholder(),
                CartPage(
                  onShopping: () {
                    bloc.updateIndexSelected(0);
                  },
                ),
                const Placeholder(),
                ProfilePage.init(context),
              ],
            ),
          ),
          NavigationBar(
            index: bloc.indexSelected,
            onIndexSelected: (index) {
              bloc.updateIndexSelected(index);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:delivery_thema/data/productos.dart';
import 'package:delivery_thema/ui/home/pages/cart/item_cart.dart';
import 'package:delivery_thema/ui/home/widgets/boton_item.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final VoidCallback onShopping;
  const CartPage({Key key, this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: _FullCart(),
    );
  }
}

class _FullCart extends StatelessWidget {
  const _FullCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              // para asignar una altura
              itemExtent: 230,
              itemBuilder: (context, index) {
                final product = products[index];
                return ItemCart(product: product);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              color: Theme.of(context).canvasColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sub total',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                            Text(
                              '0.0 €',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                            Text(
                              'Free',
                              style:
                                  Theme.of(context).textTheme.caption.copyWith(
                                        color: Theme.of(context).accentColor,
                                      ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total:',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            ),
                            Text(
                              '50.0 €',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                    color: Theme.of(context).accentColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  BotonItem(
                    onTap: () {},
                    text: 'Realizar compra',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EmptyCart extends StatelessWidget {
  final VoidCallback onShopping;
  const _EmptyCart({Key key, this.onShopping}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo/logo_anullos.png',
          height: 90,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'No has agregado productos',
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: onShopping,
            child: Text(
              'Ir a comprar',
              style: TextStyle(
                color: DeliveryColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:delivery_thema/domain/models/product.dart';
import 'package:delivery_thema/ui/home/widgets/boton_item.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  final Product product;
  const ItemProduct({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: ClipOval(
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(product.name),
                  const SizedBox(height: 5.0),
                  Text(
                    product.description,
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(color: DeliveryColors.lightGrey),
                    // para dar dos lineas solo
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    '\$${product.price} €',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            BotonItem(
              text: 'Agregar',
              onTap: () {},
              padding: const EdgeInsets.all(5.0),
            ),
          ],
        ),
      ),
    );
  }
}

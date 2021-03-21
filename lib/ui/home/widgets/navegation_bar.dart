import 'package:delivery_thema/ui/home/home_controller.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onIndexSelected;

  const NavigationBar({Key key, this.index, this.onIndexSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeController>(context);
    final user = bloc.user;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          border: Border.all(
            color: Theme.of(context).bottomAppBarColor,
            width: 4,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: index == 0
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(0),
              ),
            ),
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.store,
                  color: index == 1
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(1),
              ),
            ),
            Material(
              child: CircleAvatar(
                backgroundColor: DeliveryColors.purple,
                radius: 25,
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_basket,
                    color: index == 2
                        ? DeliveryColors.green
                        : DeliveryColors.white,
                  ),
                  onPressed: () => onIndexSelected(2),
                ),
              ),
            ),
            Material(
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: index == 3
                      ? DeliveryColors.green
                      : DeliveryColors.lightGrey,
                ),
                onPressed: () => onIndexSelected(3),
              ),
            ),
            InkWell(
              onTap: () {
                onIndexSelected(4);
              },
              child: user?.image != null
                  ? CircleAvatar(
                      radius: 15.0,
                      backgroundColor: Colors.red,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

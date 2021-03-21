import 'package:delivery_thema/ui/home/widgets/boton_item.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                const SizedBox(height: 30.0),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: DeliveryColors.green,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(radius: 50.0),
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Daniel Aranda Maestro',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Card(
                color: Theme.of(context).canvasColor,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Información personal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        'Email',
                        style: TextStyle(
                          color: DeliveryColors.green,
                        ),
                      ),
                      Text(
                        'daniel_aranda_maestro@hotmail.com',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          Text(
                            'Modo oscuro',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.caption.color,
                            ),
                          ),
                          Spacer(),
                          Switch(
                            value: true,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: BotonItem(
              text: 'Cerrar sessión',
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
            ),
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

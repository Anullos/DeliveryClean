import 'package:delivery_thema/ui/home/home_page.dart';
import 'package:delivery_thema/ui/home/widgets/boton_item.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double logoSize = 50.0;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final circleExtra = 100.0;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Parte superior del login
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Positioned(
                  bottom: logoSize,
                  left: -circleExtra / 2,
                  right: -circleExtra / 2,
                  height: width + circleExtra,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        // el stops para darle offset
                        stops: [0.6, 1.0],
                        colors: deliveryGradients,
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(width),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).canvasColor,
                    radius: logoSize,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset('assets/logo/logo_anullos.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Cuerpo del login
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 5.0),
                    Text(
                      'Login',
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Username',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle
                                .color,
                          ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          hintText: 'Username'),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle
                                .color,
                          ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          hintText: 'Password'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Boton de inicio session
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: BotonItem(
              text: 'Login',
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

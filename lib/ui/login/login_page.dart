import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/ui/home/home_page.dart';
import 'package:delivery_thema/ui/home/widgets/boton_item.dart';
import 'package:delivery_thema/ui/login/login_controller.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginController(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => LoginPage(),
    );
  }

  void signIn(BuildContext context) async {
    final loginBloc = context.read<LoginController>();
    final result = await loginBloc.signIn();
    if (result) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage.init(context)));
    } else {
      _scaffoldKey.currentState.showBottomSheet(
        (context) => BottomSheet(
          onClosing: () {},
          builder: (context) {
            return Text('Login incorrecto');
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.watch<LoginController>();
    double logoSize = 50.0;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final circleExtra = 100.0;
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          Column(
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
                          controller: loginBloc.usernameTextController,
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
                          controller: loginBloc.passwordTextController,
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
                  onTap: () => signIn(context),
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: (loginBloc.loginState == LoginState.loading)
                ? Container(
                    color: Colors.black26,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

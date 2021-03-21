import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/ui/home/home_page.dart';
import 'package:delivery_thema/ui/login/login_page.dart';
import 'package:delivery_thema/ui/splash/splash_controller.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashController(
        apiRepositoryInterface: context.read<ApiRepositoryInterface>(),
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      ),
      builder: (_, __) => SplashPage(),
    );
  }

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void _init() async {
    final bloc = context.read<SplashController>();
    final result = await bloc.validateSession();
    if (result) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => HomePage.init(context),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => LoginPage.init(context),
      ));
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: deliveryGradients,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: DeliveryColors.white,
              radius: 60,
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Image.asset('assets/logo/logo_anullos.png'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'DeliveryApp',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline3.copyWith(
                  fontWeight: FontWeight.bold, color: DeliveryColors.white),
            ),
          ],
        ),
      ),
    );
  }
}

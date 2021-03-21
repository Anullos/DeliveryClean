import 'package:delivery_thema/data/datasource/api_repository_impl.dart';
import 'package:delivery_thema/data/datasource/local_repository_impl.dart';
import 'package:delivery_thema/domain/repository/api_repository_interface.dart';
import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/ui/providers/theme_provider.dart';
import 'package:delivery_thema/ui/splash/splash_page.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ApiRepositoryInterface>(
          create: (_) => ApiRepositoryImpl(),
        ),
        Provider<LocalRepositoryInterface>(
          create: (_) => LocalRepositoryImpl(),
        ),
        ChangeNotifierProvider(
          create: (context) {
            return ThemeProvider(
              context.read<LocalRepositoryInterface>(),
            )..loadTheme();
          },
        ),
      ],
      child: Builder(builder: (newContext) {
        return Consumer<ThemeProvider>(
          builder: (context, bloc, _) {
            return bloc.currentTheme == null
                ? const SizedBox.shrink()
                : MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Delivery Theme',
                    theme: bloc.currentTheme,
                    home: SplashPage.init(context),
                  );
          },
        );
      }),
    );
  }
}

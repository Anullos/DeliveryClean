import 'package:delivery_thema/domain/repository/local_repository_interface.dart';
import 'package:delivery_thema/ui/home/home_controller.dart';
import 'package:delivery_thema/ui/home/pages/profile/profile_controller.dart';
import 'package:delivery_thema/ui/home/widgets/boton_item.dart';
import 'package:delivery_thema/ui/providers/theme_provider.dart';
import 'package:delivery_thema/ui/splash/splash_page.dart';
import 'package:delivery_thema/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  static Widget init(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileController(
        localRepositoryInterface: context.read<LocalRepositoryInterface>(),
      )..loadTheme(),
      builder: (_, __) => ProfilePage(),
    );
  }

  Future<void> logout(BuildContext context) async {
    final profileBloc = Provider.of<ProfileController>(context, listen: false);
    await profileBloc.logOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => SplashPage.init(context)),
        (route) => false);
  }

  void onThemeUpdated(BuildContext context, bool isDark) {
    final profileBloc = Provider.of<ProfileController>(context, listen: false);
    profileBloc.updateTheme(isDark);
    final themeBloc = context.read<ThemeProvider>();
    themeBloc.loadTheme();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = Provider.of<HomeController>(context);
    final profileBloc = Provider.of<ProfileController>(context);
    final user = homeBloc.user;
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: user?.image != null
          ? Column(
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
                          child: CircleAvatar(
                            radius: 50.0,
                            child: Image.asset(user.image),
                          ),
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
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .color,
                                  ),
                                ),
                                Spacer(),
                                Switch(
                                  value: profileBloc.isDark,
                                  onChanged: (value) =>
                                      onThemeUpdated(context, value),
                                  activeColor: DeliveryColors.purple,
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
                    onTap: () => logout(context),
                    text: 'Cerrar sessión',
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}

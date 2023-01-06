import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/providers/movies_provider.dart';
import 'package:udemy_app/router/app_routes.dart';
import 'package:udemy_app/routes.dart';
import 'package:udemy_app/services/auth_service.dart';
import 'package:udemy_app/services/notifications_service.dart';
import 'package:udemy_app/services/product_service.dart';
import 'package:udemy_app/shared/preferences.dart';

import 'package:udemy_app/theme/theme.dart';

import 'login/check_auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
            create: (_) => ThemeChanger(ThemeData.dark(), 1)),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductsService(),
        ),
        
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final currenTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        title: 'Mati App',
        theme: currenTheme,
        onGenerateRoute: (settings) => generateRoute(settings),
        routes: AppRoutes.getAppRoutes(),
        home: const CheckAuthScreen());
  }
}

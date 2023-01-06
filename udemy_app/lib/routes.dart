import 'package:flutter/material.dart';
import 'package:udemy_app/models/products.dart';
import 'package:udemy_app/screens/card_screen.dart';
import 'package:udemy_app/screens/home_screen.dart';
import 'package:udemy_app/screens/listview_builder_screen.dart';
import 'package:udemy_app/screens/movies/details_screen.dart';
import 'package:udemy_app/screens/products/products_details.dart';
import 'package:udemy_app/screens/products/widgets/products_card.dart';
import 'package:udemy_app/screens/slider_screen.dart';
import 'package:udemy_app/widgets/bottom_bar.dart';

import 'login/check_auth_screen.dart';
import 'login/login_screen.dart';
import 'login/register_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BottomBar(),
      );
    case DetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DetailsScreen(),
      );

    case RegisterScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterScreen(),
      );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const LoginScreen(),
      );
    case CheckAuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CheckAuthScreen(),
      );

    case ProductCard.routeName:
      var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductCard(
          product: product,
        ),
      );
    case ProductDetailsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ProductDetailsScreen(),
      );

       case SliderScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const SliderScreen(),
      );
        case CardScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CardScreen(),
      );
       case ListViewBuilderScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const ListViewBuilderScreen(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}

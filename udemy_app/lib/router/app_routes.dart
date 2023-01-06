import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_app/screens/animated_screen.dart';
import 'package:udemy_app/screens/avatar_screen.dart';
import 'package:udemy_app/screens/card_screen.dart';
import 'package:udemy_app/screens/slider_screen.dart';

import '../models/menu_option.dart';
import '../login/register_screen.dart';

class AppRoutes {
  static const initialRoute = 'Initial';

  static final menuOptions = <MenuOption>[
    // MenuOption(
    //     route: 'Home',
    //     icon: Icons.manage_search_outlined,
    //     name: 'Home',
    //     screen: const HomeScreen()),
    MenuOption(
        route: 'slider',
        icon: FontAwesomeIcons.sliders,
        name: 'Slider',
        screen: const SliderScreen()),
    MenuOption(
        route: 'cards',
        icon: FontAwesomeIcons.table,
        name: 'Cards',
        screen: const CardScreen()),
    MenuOption(
        route: 'avatar',
        icon: FontAwesomeIcons.userAstronaut,
        name: 'Avatar',
        screen: const AvatarScreen()),
    MenuOption(
        route: 'animated',
        icon: FontAwesomeIcons.appStore,
        name: 'Animated Screen',
        screen: const AnimatedScreen()),
    MenuOption(
        route: 'inputs',
        icon: FontAwesomeIcons.personArrowDownToLine,
        name: 'Inputs Custom',
        screen: const RegisterScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}












// import 'package:flutter/material.dart';
// import 'package:udemy_app/screens/alert_screen.dart';
// import 'package:udemy_app/screens/animated_screen.dart';
// import 'package:udemy_app/screens/avatar_screen.dart';
// import 'package:udemy_app/screens/card_screen.dart';
// import 'package:udemy_app/screens/home_screen.dart';
// import 'package:udemy_app/screens/inputs_screen.dart';
// import 'package:udemy_app/screens/listview2_screen.dart';
// import 'package:udemy_app/screens/listview_builder_screen.dart';
// import 'package:udemy_app/screens/slider_screen.dart';

// import '../models/menu_option.dart';
// import '../screens/listview1_screen.dart';
// import '../screens/movies.dart/widgets_movies/movies_screen.dart';

// class AppRoutes {
//   static const initialRoute = 'home';

//   static final menuOptions = <MenuOption>[
//     MenuOption(
//         route: 'listview1',
//         name: 'Listview tipo 1',
//         screen: const Listview1Screen(),
//         icon: Icons.list_alt),
//     MenuOption(
//         route: 'listview2',
//         name: 'Listview tipo 2',
//         screen: const Listview2Screen(),
//         icon: Icons.list),
//     MenuOption(
//         route: 'alert',
//         name: 'Alertas - Alerts',
//         screen: const AlertScreen(),
//         icon: Icons.add_alert_outlined),
//     MenuOption(
//         route: 'card',
//         name: 'Tarjetas - Cards',
//         screen: const CardScreen(),
//         icon: Icons.credit_card),
//     MenuOption(
//         route: 'avatar',
//         name: 'Circle Avatar',
//         screen: const AvatarScreen(),
//         icon: Icons.supervised_user_circle_outlined),
//     MenuOption(
//         route: 'animated',
//         name: 'Animated Container',
//         screen: const AnimatedScreen(),
//         icon: Icons.play_circle_outline_rounded),
//     MenuOption(
//         route: 'inputs',
//         name: 'Text Inputs',
//         screen: const InputsScreen(),
//         icon: Icons.input_rounded),
//     MenuOption(
//         route: 'slider',
//         name: 'Slider && Checks',
//         screen: const SliderScreen(),
//         icon: Icons.slow_motion_video_rounded),
//     MenuOption(
//         route: 'listviewbuilder',
//         name: 'InfiniteScrol & Pull to refresh',
//         screen: const ListViewBuilderScreen(),
//         icon: Icons.build_circle_outlined),
//     MenuOption(
//         route: 'moviesscreen',
//         name: 'Movies',
//         screen: const MoviesScreen(),
//         icon: Icons.movie_creation),
//   ];

//   static Map<String, Widget Function(BuildContext)> getAppRoutes() {
//     Map<String, Widget Function(BuildContext)> appRoutes = {};
//     appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

//     for (final option in menuOptions) {
//       appRoutes.addAll({option.route: (BuildContext context) => option.screen});
//     }

//     return appRoutes;
//   }

//   static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//     return MaterialPageRoute(
//       builder: (context) => const AlertScreen(),
//     );
//   }
// }

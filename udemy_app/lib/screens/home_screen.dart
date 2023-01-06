import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:udemy_app/theme/app_theme.dart';
import 'package:udemy_app/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          // backgroundColor: const Color(0xff2169A3),
          title: const Text(
            'Welcome to me App',
            style: TextStyle(fontFamily: 'Mokoto', fontWeight: FontWeight.w400),
          ),
        ),
        body: Container(
          color: AppTheme.primary,
          width: double.infinity,
          height: double.infinity,
          child: const SizedBox(
            width: 300,
            height: 300,
            child: RiveAnimation.asset('assets/flutter.riv'),
          ),
        ));
  }
}


//  ListView.separated(
//             itemBuilder: (context, i) => ListTile(
//                   leading: Icon(menuOptions[i].icon, color: AppTheme.primary),
//                   title: Text(menuOptions[i].name),
//                   onTap: () {
//                     // final route = MaterialPageRoute(
//                     //   builder: (context) => const Listview1Screen(),
//                     // );
//                     // Navigator.push(context, route );

//                     Navigator.pushNamed(context, menuOptions[i].route);
//                   },
//                 ),
//             separatorBuilder: (_, __) => const Divider(),
//             itemCount: menuOptions.length)
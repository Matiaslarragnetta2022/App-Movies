import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/widgets/switch_dark_mode.dart';
import '../services/auth_service.dart';
import '../shared/preferences.dart';
import '../theme/app_theme.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
   // final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: 80,
            color: AppTheme.primary,
            child: Container(
              margin: const EdgeInsets.only(right: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Preferences.name,
                    style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            indent: 2,
            color: Colors.white,
          ),
          ListTile(
            title: const Text(
              'Slider',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                'slider',
              );
            },
          ),
          ListTile(
            title: const Text(
              'Cards',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.monetization_on,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/card',
              );
            },
          ),
          ListTile(
            title: const Text(
              'Listview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.analytics_outlined,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/listview',
              );
            },
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            leading: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '',
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton.icon(
              onPressed: (() {
                authService.logout();
                Navigator.pushReplacementNamed(context, '/login');
              }),
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              label: const Text(
                'Cierre de sesion',
                style: TextStyle(color: Colors.white),
              )),
          Column(
            children: const [SwitchDarkMode()],
          )
        ],
      ),
    );
  }
}

//     return ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       separatorBuilder: (context, i) => Divider(
//         color: appTheme.primaryColorLight,
//       ),
//       itemCount: pageRoutes.length,
//       itemBuilder: (context, i) => ListTile(
//         leading: FaIcon(pageRoutes[i].icon, color: appTheme.accentColor),
//         title: Text(pageRoutes[i].titulo),
//         trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
//         onTap: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => pageRoutes[i].page));
//         },
//       ),
//     );
//   }
// }

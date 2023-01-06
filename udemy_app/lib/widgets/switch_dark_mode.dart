import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:udemy_app/services/auth_service.dart';
import 'package:udemy_app/shared/preferences.dart';
import 'package:udemy_app/theme/theme.dart';

class SwitchDarkMode extends StatefulWidget {
  const SwitchDarkMode({Key? key}) : super(key: key);

  @override
  State<SwitchDarkMode> createState() => _SwitchDarkModeState();
}

class _SwitchDarkModeState extends State<SwitchDarkMode> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final appTheme = Provider.of<ThemeChanger>(context);
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        ListTile(
          leading: const Icon(
            Icons.lightbulb_outline,
            color: Colors.blue,
          ),
          title: const Text('Dark Mode'),
          trailing: Switch.adaptive(
            value: appTheme.darkTheme,
            onChanged: (value) => appTheme.darkTheme = value,
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.phone_android,
            color: Colors.blue,
          ),
          title: const Text('Custom Theme'),
          trailing: Switch.adaptive(
            value: appTheme.customTheme,
            onChanged: (value) => appTheme.customTheme = value,
          ),
        ),
        TextButton.icon(
            onPressed: (() {
              authService.logout();
              Navigator.pushReplacementNamed(context, '/login');
            }),
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Cierre de sesion')),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextFormField(
            initialValue: Preferences.name,
            onChanged: (value) {
              Preferences.name = value;
              setState(() {});
            },
            decoration: const InputDecoration(
              hintText: 'usuario',
              helperText: 'usuario',
            ),
          ),
        ),
      ],
    );
  }
}

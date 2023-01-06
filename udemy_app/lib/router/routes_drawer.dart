import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_app/screens/alert_screen.dart';
import 'package:udemy_app/screens/animated_screen.dart';
import 'package:udemy_app/screens/avatar_screen.dart';
import 'package:udemy_app/screens/card_screen.dart';
import 'package:udemy_app/screens/listview1_screen.dart';
import 'package:udemy_app/screens/listview_builder_screen.dart';
import 'package:udemy_app/screens/slider_screen.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Animated Container',
      const AnimatedScreen()),
  _Route(FontAwesomeIcons.person, 'Profile', const AvatarScreen()),
  _Route(FontAwesomeIcons.heading, 'Card Widget', const CardScreen()),
  _Route(FontAwesomeIcons.circleNotch, 'Sliders', const SliderScreen()),
  _Route(FontAwesomeIcons.pinterest, 'Alert', const AlertScreen()),
  _Route(FontAwesomeIcons.mobile, 'Listview Builder', const Listview1Screen()),
  _Route(FontAwesomeIcons.imagePortrait, 'Imagenes',
      const ListViewBuilderScreen()),
];

class _Route {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Route(this.icon, this.titulo, this.page);
}

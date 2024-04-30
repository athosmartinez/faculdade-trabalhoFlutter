import 'package:flutter/material.dart';

class ParamBottomNavigation {
  final String label;
  final IconData icon;
  final String route;

  const ParamBottomNavigation({
    required this.label,
    required this.icon,
    required this.route,
  });
}

class BottomNavigation extends StatelessWidget {
  final ParamBottomNavigation param1;
  final ParamBottomNavigation param2;

  const BottomNavigation({
    super.key,
    required this.param1,
    required this.param2,
  });

  void navigation(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushNamedAndRemoveUntil(context, route, (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) => navigation(context, index == 0 ? param1.route : param1.route),
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(param1.icon), label: param1.label),
        BottomNavigationBarItem(icon: Icon(param2.icon), label: param2.label),
      ],
    );
  }
}

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

class BottomNavigation extends StatefulWidget {
  final ParamBottomNavigation param1;
  final ParamBottomNavigation param2;

  const BottomNavigation({
    super.key,
    required this.param1,
    required this.param2,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void navigation(BuildContext context, String route) {
    if (ModalRoute.of(context)?.settings.name != route) {
      Navigator.pushReplacementNamed(context, route);
    }
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      navigation(
          context,
          index == 0 ? widget.param1.route : widget.param2.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onItemTapped,
      backgroundColor: Colors.red,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(widget.param1.icon), label: widget.param1.label),
        BottomNavigationBarItem(icon: Icon(widget.param2.icon), label: widget.param2.label),
      ],
    );
  }
}

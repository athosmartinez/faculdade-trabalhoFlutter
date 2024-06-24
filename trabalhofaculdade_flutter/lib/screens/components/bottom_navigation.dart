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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute == widget.param1.route) {
      _selectedIndex = 0;
    } else if (currentRoute == widget.param2.route) {
      _selectedIndex = 1;
    }
  }

  void _onItemTapped(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      final String route = index == 0 ? widget.param1.route : widget.param2.route;
      Navigator.pushReplacementNamed(context, route);
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

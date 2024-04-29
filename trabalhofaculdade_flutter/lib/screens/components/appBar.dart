// wavy_header.dart

import 'package:flutter/material.dart';

class WavyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final double height;

  const WavyAppBar({
    Key? key,
    this.backgroundColor = Colors.red, // Cor padrão é vermelha
    this.height = 120.0, // Altura padrão
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _WavyClipper(),
      child: Container(
        color: backgroundColor,
        height: height,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20); // O início da onda
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0); // O final da onda no canto superior direito
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

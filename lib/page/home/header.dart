import 'package:caritukang/page/home/app_bar.dart';
import 'package:caritukang/page/home/ovo_card.dart';
import 'package:caritukang/page/home/welcome_message.dart';
import "package:flutter/material.dart";

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    @required this.height,
    @required this.borderRadius,
  }) : super(key: key);

  final double height;
  final Radius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: double.infinity, height: height),
        Container(
          width: double.infinity,
          height: height * 3 / 4,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: borderRadius),
          ),
        ),
        ClipPath(
          clipper: BannerAssetClipper(),
          child: Container(
            height: height * 5 / 8,
            width: height * 5 / 8,
            color: Color(0xFF5F81D9),
          ),
        ),
        AppBarWidget(),
        WelcomeMessageWidget(height: height * 11 / 16),
        Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: OVOCardWidget(height: 200, borderRadius: Radius.circular(20)),
          ),
        ),
      ],
    );
  }
}

class BannerAssetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width * 0.6, 0)
      ..cubicTo(
        size.width * 0.8,
        size.height * 0.4,
        size.width * 1,
        size.height * 0.2,
        size.width * 1,
        size.height * 0.5,
      )
      ..quadraticBezierTo(
        size.width * 1,
        size.height * 1,
        size.width * 0.5,
        size.height * 1,
      )
      ..cubicTo(
        size.width * 0.2,
        size.height * 1,
        size.width * 0.2,
        size.height * 0.9,
        size.width * 0,
        size.height * 0.8,
      )
      ..lineTo(0, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

import 'package:flutter/material.dart';

class WelcomeMessageWidget extends StatelessWidget {
  const WelcomeMessageWidget({
    Key key,
    @required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50),
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: "Hi, Steven"
            .split(" ")
            .map((e) => Text(e,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.5,
                )))
            .toList(),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OVOCardWidget extends StatelessWidget {
  const OVOCardWidget({
    Key key,
    @required this.height,
    @required this.borderRadius,
  }) : super(key: key);

  final double height;
  final Radius borderRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.all(borderRadius),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: borderRadius),
                  gradient: LinearGradient(colors: [Color(0xFF6552A8), Theme.of(context).accentColor]),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    ClipPath(
                      clipper: OVOAssetClipper(),
                      child: Container(
                        height: height * 3 / 4,
                        width: height * 3 / 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(top: borderRadius),
                          gradient: LinearGradient(
                            colors: [Color(0xFF6E60A1), Color(0xFF584A88)],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -6,
                      child: FlatButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text("TOP UP", style: TextStyle(color: Colors.white)),
                            SizedBox(width: 10),
                            Icon(Icons.add_circle_outline, color: Colors.white),
                          ],
                        ),
                        color: Color(0xFF39BDF5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: borderRadius,
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 30,
                      height: height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("OVO CASH", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: height / 20),
                          Text("Rp. 150.000", style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("OVO CASH", style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 7),
                        Text("Rp. 11.298", style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          color: Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: height / 4,
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text("Redeem Deals", style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor)),
                              Icon(Icons.chevron_right_sharp, color: Theme.of(context).accentColor),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OVOAssetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.5, size.height)
      ..cubicTo(size.width * 0.4, size.height * 0.8, -10, size.height * 0.7, size.width * 0.2, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

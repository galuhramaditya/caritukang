import "package:flutter/material.dart";

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 30,
      child: ListTile(
        title: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 5),
            hintText: "Cari",
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.notifications_none, size: 30),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    );
  }
}

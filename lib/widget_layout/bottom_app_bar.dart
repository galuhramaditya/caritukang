import 'package:flutter/material.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({Key key, this.currentIndex = 0});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          title: Text("Pesanan"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment),
          title: Text("Pembayaran"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          title: Text("Inbox"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment_ind),
          title: Text("Akun"),
        ),
      ],
    );
  }
}

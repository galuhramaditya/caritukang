import 'package:caritukang/page/home/category_section.dart';
import 'package:caritukang/page/home/header.dart';
import 'package:caritukang/widget_layout/bottom_app_bar.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBarWidget(currentIndex: 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              height: 400,
              borderRadius: Radius.circular(30),
            ),
            CategorySectionWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Container(
        child: Text('Hello')
      )
    );
  }
}

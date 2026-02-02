import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(80)),
            Obx(
              () => Text("${controller.count}", style: TextStyle(fontSize: 40)),
            ),
            Padding(padding: EdgeInsets.all(80)),
            ElevatedButton(
              onPressed: () => controller.increment(),
              child: Text("เพิ่มเลข (+)", style: TextStyle(fontSize: 20)),
            ),

            ElevatedButton(
              onPressed: () => controller.decrement(),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]),
              child: Text("ลดเลข (-)", style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

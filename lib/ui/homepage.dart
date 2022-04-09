import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.toNamed('/git-repositories'),
          child: const Text('Показать пагинацию'),
        ),
      ),
    );
  }
}

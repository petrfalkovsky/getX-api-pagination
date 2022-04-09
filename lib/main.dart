import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_p8n/binding/repo_binding.dart';
import 'package:getx_p8n/ui/homepage.dart';
import 'package:getx_p8n/ui/list_page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
      ),
      GetPage(
        name: '/git-repositories',
        page: () => const GitRepositoryPage(),
        binding: GitRepositoryBinding(),
      ),
    ],
  ));
}

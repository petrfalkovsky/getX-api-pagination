import 'package:get/get.dart';
import 'package:getx_p8n/controllers/repo_controller.dart';
import 'package:getx_p8n/data/constants.dart';

class GitRepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GitRepositoryProvider());
    Get.put(GitRepositoryController(provider: Get.find()));
  }
}

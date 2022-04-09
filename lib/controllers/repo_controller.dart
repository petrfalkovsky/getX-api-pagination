import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_p8n/data/constants.dart';
import 'package:getx_p8n/models/repo_model.dart';

class GitRepositoryController extends GetxController
    with StateMixin<List<GitRepositoryModel>>, ScrollMixin {
  final GitRepositoryProvider provider;
  GitRepositoryController({required this.provider});

  List<GitRepositoryModel> repositories = [];
  final int repositoriesPerPage = 10;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    findAllGitRepositories();
    super.onInit();
  }

  Future<void> findAllGitRepositories() async {
    await provider.getGitRepositories(repositoriesPerPage, page).then((result) {
      final bool emptyRepositories = result.body?.isEmpty ?? true;
      if (!getFirstData && emptyRepositories) {
        change(null, status: RxStatus.empty());
      } else if (getFirstData && emptyRepositories) {
        lastPage = true;
      } else {
        getFirstData = true;
        repositories.addAll(result.body!);
        change(repositories, status: RxStatus.success());
      }
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  Future<void> onEndScroll() async {
    if (kDebugMode) {
      print('onEndScroll');
    }
    if (!lastPage) {
      page += 1;
      Get.dialog(const Center(child: CircularProgressIndicator()));
      await findAllGitRepositories();
      Get.back();
    } else {
      Get.snackbar('Внимание!', 'Конец списка. Это пока все.');
    }
  }

  @override
  Future<void> onTopScroll() async {
    if (kDebugMode) {
      print('onTopScroll');
    }
  }
}

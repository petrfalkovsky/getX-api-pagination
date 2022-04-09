import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_p8n/controllers/repo_controller.dart';
import 'package:getx_p8n/models/repo_model.dart';

class GitRepositoryPage extends GetView<GitRepositoryController> {
  const GitRepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Repositories')),
        body: Container(
          child: controller.obx(
            (state) => ListView.builder(
              controller: controller.scroll,
              itemCount: state?.length,
              itemBuilder: (context, index) {
                final GitRepositoryModel repository = state![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 70, top: 20),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(repository.owner)),
                      ),
                    ),
                    ListTile(
                      isThreeLine: true,
                      leading: Text(
                        (++index).toString(),
                        style: const TextStyle(fontSize: 60),
                      ),
                      title: Text(repository.fullName),
                      subtitle: Text(
                          '${repository.description}\n${repository.owner}'),
                    ),
                  ],
                );
              },
            ),
            onLoading: const Center(child: CircularProgressIndicator()),
            onEmpty: const Center(
              child: Text(
                'Repositories no found',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            onError: (error) => Center(
              child: Text(
                'Error: Cannot get repositories \n$error',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ));
  }
}

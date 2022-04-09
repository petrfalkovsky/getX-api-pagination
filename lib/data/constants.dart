import 'package:get/get.dart';
import 'package:getx_p8n/models/repo_model.dart';

class GitRepositoryProvider extends GetConnect {
  final String org = 'flutter';

  @override
  void onInit() {
    httpClient.defaultDecoder = GitRepositoryModel.listFromJson;
    httpClient.baseUrl = 'https://api.github.com/orgs';
  }

  Future<Response<List<GitRepositoryModel>>> getGitRepositories(
          int itemsPerPage, int page) =>
      get<List<GitRepositoryModel>>(
        '/$org/repos?per_page=$itemsPerPage&page=$page',
        decoder: GitRepositoryModel.listFromJson,
      );
}

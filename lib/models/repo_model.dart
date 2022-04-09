class GitRepositoryModel {
  GitRepositoryModel({
    required this.fullName,
    required this.description,
    required this.owner,
  });

  String fullName;
  String description;
  String owner;

  factory GitRepositoryModel.fromJson(Map<String, dynamic> json) =>
      GitRepositoryModel(
        fullName: json['full_name'],
        description: json['description'] ?? 'No description',
        owner: json['owner']['avatar_url'],
      );

  static List<GitRepositoryModel> listFromJson(list) =>
      List<GitRepositoryModel>.from(
          list.map((x) => GitRepositoryModel.fromJson(x)));
}

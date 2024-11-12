import 'package:get/get.dart';

class ModelTask {
  final int? id;
  final String title;
  final String description;
  RxBool? isSelected;

  ModelTask({
    this.id,
    required this.title,
    required this.description,
    this.isSelected,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory ModelTask.fromJson(Map<String, dynamic> json) {
    return ModelTask(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isSelected: false.obs);
  }
}

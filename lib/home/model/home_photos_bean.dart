import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package:flutter_template_demo3/home/model/home_photos_bean.g.dart';

/// A task as part of a TO-DO list.
@JsonSerializable()
@immutable
class HomePhotosBean extends Equatable {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const HomePhotosBean({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory HomePhotosBean.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  HomePhotosBean copy({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) =>
      HomePhotosBean(
        userId: this.userId,
        id: this.id,
        title: this.title,
        completed: this.completed,
      );

  @override
  List<Object?> get props => [id];

  @override
  String toString() {
    return 'Task2{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}

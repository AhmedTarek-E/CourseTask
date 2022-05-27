import 'package:inovola_task/course/data/models/api_course_result.dart';
import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/course/domain/models/trainer.dart';

extension CourseMapper on ApiCourseResult {
  Course map() {
    return Course(
      id ?? 0,
      title ?? "",
      img ?? [],
      isLiked ?? false,
      interest ?? "",
      date ?? DateTime.now(),
      address ?? "",
      Trainer(
        0,
        trainerName ?? "",
        trainerImg ?? "",
        trainerInfo ?? "",
      ),
      occasionDetail ?? "",
      price ?? 0,
    );
  }
}
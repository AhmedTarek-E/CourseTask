import 'package:inovola_task/course/data/models/api_course_result.dart';
import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/course/domain/models/trainer.dart';

extension CourseMapper on ApiCourseResult {
  Course map() {
    return Course(
      id ?? 0,
      title ?? "",
      //Images returned were malformed
      // img ?? [],
      [
        "https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q=",
        "https://i.pinimg.com/originals/9c/b0/70/9cb070d62dc738a0c3a1a408d68e4af5.jpg",
        "https://thumbs.dreamstime.com/b/hand-holding-glass-globe-ball-tree-growing-green-nature-blur-background-eco-concept-161081206.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Living_with_nature.jpg/1200px-Living_with_nature.jpg",
      ],
      isLiked ?? false,
      interest ?? "",
      date ?? DateTime.now(),
      address ?? "",
      Trainer(
        0,
        trainerName ?? "",
        // trainerImg ?? "",
        "https://avatars.githubusercontent.com/u/16105350?v=4",
        trainerInfo ?? "",
      ),
      occasionDetail ?? "",
      price ?? 0,
    );
  }
}
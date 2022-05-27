import 'package:inovola_task/course/domain/models/course.dart';

abstract class CourseRepository {
  Future<Course> getCourseDetails();
}
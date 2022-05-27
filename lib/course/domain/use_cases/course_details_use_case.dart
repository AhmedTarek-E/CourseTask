import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/course/domain/repositories/course_repository.dart';

class CourseDetailsUseCase {
  final CourseRepository repository;

  CourseDetailsUseCase(this.repository);

  Future<Course> execute() {
    return repository.getCourseDetails();
  }
}
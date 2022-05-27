import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/course/domain/repositories/course_repository.dart';

class CourseDetailsUseCase {
  final CourseRepository _repository;

  CourseDetailsUseCase(this._repository);

  Future<Course> execute() {
    return _repository.getCourseDetails();
  }
}
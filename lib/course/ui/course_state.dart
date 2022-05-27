import 'package:equatable/equatable.dart';
import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/utils/async.dart';

class CourseState extends Equatable {
  final String? errorMessage;
  final Async<Course> courseDetails;

  const CourseState(this.errorMessage, this.courseDetails);

  const CourseState.initial() : this(
    null,
    const Async.initial(),
  );

  CourseState reduce({
    String? errorMessage,
    Async<Course>? courseDetails,
  }) {
    return CourseState(
        errorMessage,
        courseDetails ?? this.courseDetails,
    );
  }

  @override
  List<Object?> get props => [
    errorMessage,
    courseDetails,
  ];
}

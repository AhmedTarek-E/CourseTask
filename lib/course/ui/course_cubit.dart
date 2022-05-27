import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/course/domain/use_cases/course_details_use_case.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseDetailsUseCase _courseDetailsUseCase;

  CourseCubit(this._courseDetailsUseCase) : super(const CourseState.initial());
}
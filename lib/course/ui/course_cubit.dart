import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/course/domain/use_cases/course_details_use_case.dart';
import 'package:inovola_task/utils/async.dart';
import 'package:inovola_task/utils/common.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  final CourseDetailsUseCase _courseDetailsUseCase;

  CourseCubit(this._courseDetailsUseCase) : super(const CourseState.initial());
  
  void onStarted() async {
    emit(state.reduce(courseDetails: const Async.loading()));

    try {
      final result = await _courseDetailsUseCase.execute();
      emit(state.reduce(
        courseDetails: Async.success(result)
      ));
    } catch(e) {
      logDebug(e);
      emit(state.reduce(
        errorMessage: "Something went wrong",
        courseDetails: const Async.failure("error"),
      ));
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/course/data/course_repository_imp.dart';
import 'package:inovola_task/course/domain/use_cases/course_details_use_case.dart';
import 'package:inovola_task/course/ui/widgets/images_carousel.dart';
import 'course_cubit.dart';

class CoursePage extends StatelessWidget {
  static const String route = '/course';

  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseCubit>(
      create: (context) {
        return CourseCubit(
          CourseDetailsUseCase(CourseRepositoryImp())
        );
      },
      child: const Scaffold(
        body: CourseBody(),
      ),
    );
  }

}

class CourseBody extends StatelessWidget {
  const CourseBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: calculateExpandedHeight(context),
          flexibleSpace: FlexibleSpaceBar(
            background: ImagesCarousel(),
          ),
          actions: [

          ],
        )
      ],
    );
  }

  double calculateExpandedHeight(BuildContext context) {
    const aspectRatio = 1.6;
    final width = MediaQuery.of(context).size.width;
    return width / aspectRatio;
  }
}
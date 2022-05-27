import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inovola_task/course/data/course_repository_imp.dart';
import 'package:inovola_task/course/domain/use_cases/course_details_use_case.dart';
import 'package:inovola_task/course/ui/course_state.dart';
import 'package:inovola_task/course/ui/widgets/about_course.dart';
import 'package:inovola_task/course/ui/widgets/course_cost.dart';
import 'package:inovola_task/course/ui/widgets/course_info.dart';
import 'package:inovola_task/course/ui/widgets/images_carousel.dart';
import 'package:inovola_task/course/ui/widgets/trainer_info.dart';
import 'package:inovola_task/utils/app_colors.dart';
import 'package:inovola_task/utils/dimensions.dart';
import 'package:inovola_task/utils/text_styles.dart';
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
        )..onStarted();
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
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              _buildAppBar(context),
              _buildBody(context),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: AppColors.primaryColor,
          child: TextButton(
            onPressed: () {
              //TODO implement
            },
            child: Text(
              "قم بالحجز الآن",
              style: TextStyles.semiBold(
                color: AppColors.textSecondaryColor,
                fontSize: Dimensions.large
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                    (states) => AppColors.primaryColor),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                )),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(0)),
                    ))),
          ),
        ),
        Container(
          color: AppColors.primaryColor,
          height: MediaQuery.of(context).padding.bottom,
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SliverToBoxAdapter(
      child: SafeArea(
        top: false,
        bottom: false,
        child: BlocBuilder<CourseCubit, CourseState>(
          builder: (context, state) {
            if (!state.courseDetails.isSuccess) {
              return const SizedBox();
            }

            final course = state.courseDetails.data!;

            return Column(
              children: [
                const SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CourseInfo(course: course),
                ),

                const SizedBox(height: 16,),

                _buildDivider(),

                const SizedBox(height: 16,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TrainerInfo(trainer: course.trainer),
                ),

                const SizedBox(height: 16,),

                _buildDivider(),

                const SizedBox(height: 16,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: AboutCourse(description: course.description,),
                ),

                const SizedBox(height: 16,),

                _buildDivider(),

                const SizedBox(height: 16,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CourseCost(price: course.price),
                ),
                
                const SizedBox(height: 24,),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: AppColors.textPrimaryColor,
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: calculateExpandedHeight(context),
      backgroundColor: AppColors.primaryColor,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: BlocBuilder<CourseCubit, CourseState>(
            builder: (context, state) {
              final Widget child;
              if (state.courseDetails.isSuccess) {
                child = ImagesCarousel(
                  images: state.courseDetails.data?.images ?? [],
                );
              } else {
                child = Container(color: AppColors.primaryLightColor,);
              }
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: child,
              );
            }
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            //TODO, implement
          },
          icon: Image.asset(
            "images/saveIcon.png",
          ),
        ),

        const SizedBox(width: 8,),

        IconButton(
          onPressed: () {
            //TODO, implement
          },
          icon: Image.asset(
            "images/shareIcon.png",
          ),
        ),

        const SizedBox(width: 12,),
      ],
    );
  }

  double calculateExpandedHeight(BuildContext context) {
    final aspectRatio = Dimensions.isMobile ? 1.6 : 3.6;
    final width = MediaQuery.of(context).size.width;
    return width / aspectRatio;
  }
}
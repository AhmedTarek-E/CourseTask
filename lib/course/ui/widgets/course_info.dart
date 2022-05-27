import 'package:flutter/material.dart';
import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/utils/app_colors.dart';
import 'package:inovola_task/utils/dimensions.dart';
import 'package:inovola_task/utils/text_styles.dart';
import 'package:intl/intl.dart';

class CourseInfo extends StatelessWidget {
  final Course course;
  const CourseInfo({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "# ${course.interest}",
            style: TextStyles.regular(
                color: AppColors.textPrimaryColor,
                fontSize: Dimensions.normal
            ),
          ),

          const SizedBox(height: 16,),

          Text(
            course.name,
            style: TextStyles.bold(
              color: AppColors.textPrimaryColor,
              fontSize: Dimensions.xLarge
            ),
          ),

          const SizedBox(height: 16,),

          _buildDate(context),

          const SizedBox(height: 16,),

          _buildAddress()

        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Row(
      children: [
        Image.asset(
          "images/addressIcon.png",
          width: 16,
          height: 16,
        ),

        const SizedBox(width: 8,),

        Text(
          course.address,
          style: TextStyles.regular(
            color: AppColors.textPrimaryColor,
            fontSize: Dimensions.normal
          ),
        ),

      ],
    );
  }

  Widget _buildDate(BuildContext context) {
    final lang = Localizations.localeOf(context).languageCode;
    final formatter = DateFormat(
        "EEEE, d MMMM, h:mm a",
        lang,
    );
    return Row(
      children: [
        Image.asset(
          "images/dateIcon.png",
          height: 16,
          width: 16,
        ),

        const SizedBox(width: 8,),

        Text(
          formatter.format(course.date),
          style: TextStyles.regular(
            color: AppColors.textPrimaryColor,
            fontSize: Dimensions.normal
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inovola_task/utils/app_colors.dart';
import 'package:inovola_task/utils/dimensions.dart';
import 'package:inovola_task/utils/text_styles.dart';

class AboutCourse extends StatelessWidget {
  final String description;
  const AboutCourse({Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "عن الدورة",
            style: TextStyles.semiBold(
              color: AppColors.textPrimaryColor,
              fontSize: Dimensions.large
            ),
          ),

          const SizedBox(height: 8,),

          Text(
            description,
            style: TextStyles.regular(
              color: AppColors.textPrimaryColor,
              fontSize: Dimensions.normal
            ),
          )
        ],
      ),
    );
  }
}

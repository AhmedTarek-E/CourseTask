import 'package:flutter/material.dart';
import 'package:inovola_task/course/domain/models/trainer.dart';
import 'package:inovola_task/utils/app_colors.dart';
import 'package:inovola_task/utils/dimensions.dart';
import 'package:inovola_task/utils/image_preview/app_network_image.dart';
import 'package:inovola_task/utils/text_styles.dart';

class TrainerInfo extends StatelessWidget {
  final Trainer trainer;
  const TrainerInfo({Key? key, required this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AppNetworkImage(
                image: trainer.image,
                width: 32,
                height: 32,
              ),
            ),

            const SizedBox(width: 8,),

            Text(
              trainer.name,
              style: TextStyles.semiBold(
                color: AppColors.textPrimaryColor,
                fontSize: Dimensions.large
              ),
            ),
          ],
        ),

        const SizedBox(height: 8,),

        Text(
          trainer.bio,
          style: TextStyles.regular(
            color: AppColors.textPrimaryColor,
            fontSize: Dimensions.normal
          ),
        )

      ],
    );
  }
}

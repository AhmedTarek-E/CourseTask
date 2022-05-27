import 'package:flutter/material.dart';
import 'package:inovola_task/utils/app_colors.dart';
import 'package:inovola_task/utils/dimensions.dart';
import 'package:inovola_task/utils/text_styles.dart';

class CourseCost extends StatelessWidget {
  final int price;
  const CourseCost({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تكلفة الدورة",
          style: TextStyles.semiBold(
              color: AppColors.textPrimaryColor,
              fontSize: Dimensions.large
          ),
        ),

        const SizedBox(height: 8,),

        Row(
          children: [
            Expanded(
              child: Text(
                "الحجز",
                style: TextStyles.regular(
                  color: AppColors.textPrimaryColor,
                  fontSize: Dimensions.normal
                ),
              ),
            ),
            
            Text(
              "SAR $price",
              style: TextStyles.regular(
                color: AppColors.textPrimaryColor,
                fontSize: Dimensions.normal
              ),
            )
          ],
        )
      ],
    );
  }
}

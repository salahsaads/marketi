import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/profile/presentation/logic/profile_cubit.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 309.w,
      height: 216.h,
      decoration: ShapeDecoration(
        shape: OvalBorder(
          side: BorderSide(
            width: 1.50.w,
            strokeAlign: BorderSide.strokeAlignOutside,
            color: const Color(0xFFD9E6FF),
          ),
        ),
        image: const DecorationImage(
          image: AssetImage('assets/images/Shapes.png'),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
                'https://image.lexica.art/full_jpg/c9537cf5-4e95-4394-86d4-85155b4e938e'),
          ),
          verticalSpace(8),
          Text(
            '${ProfileCubit.get(context).userModel!.data!.name}',
            style: AppStyles.style18SemiBold,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

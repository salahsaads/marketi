import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/theme/app_styles.dart';
import 'package:marketi/core/theme/spaces.dart';
import 'package:marketi/features/auth/presentation/logic/register/register_cubit.dart';

class SelectProfileImage extends StatelessWidget {
  const SelectProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CircleAvatar(
            radius: 90.r,
            backgroundColor: const Color(0xB2B2CCFF),
            child: const CircleAvatar(
              radius: 85,
              backgroundImage: NetworkImage(
                  'https://image.lexica.art/full_jpg/c9537cf5-4e95-4394-86d4-85155b4e938e'),
            ),
          ),
          IconButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                sheetAnimationStyle: AnimationStyle(
                  curve: Curves.elasticOut,
                  duration: const Duration(milliseconds: 800),
                ),
                builder: (context) => Container(
                  height: 160.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            RegisterCubit.get(context)
                                .getProfileImage('camera');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/camera.png',
                                height: 80,
                              ),
                              verticalSpace(8),
                              Text('Camera', style: AppStyles.style18SemiBold),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            RegisterCubit.get(context)
                                .getProfileImage('gallery');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/gallery.png',
                                height: 80,
                              ),
                              verticalSpace(8),
                              Text('Gallery', style: AppStyles.style18SemiBold),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.camera_alt_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

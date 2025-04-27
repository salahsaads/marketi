import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:marketi/core/widgets/app_text_form_field.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: AppTextFormField(
          hintText: 'ما الذي تبحث عنه ؟',
          textInputType: TextInputType.text,
          validator: (p0) {},
          onChanged: (value) {},
          prefixIcon: const Icon(Icons.search, size: 30, color: Colors.blue),
          suffixIcon:
              const Icon(IconlyBold.filter, size: 30, color: Colors.blue),
        ),
      ),
    );
  }
}

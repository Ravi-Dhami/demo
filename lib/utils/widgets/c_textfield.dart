import 'package:demo_task/utils/constant/color.dart';
import 'package:demo_task/utils/constant/text_style.dart';
import 'package:flutter/material.dart';

class CommonField extends StatelessWidget {
  final String? hintText;
  final bool? isSecure;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const CommonField(
      {Key? key,
      this.hintText,
      this.validator,
      this.isSecure = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 10),
      child: TextFormField(
        controller: controller,
        style: AppTextStyle.subTitle,
        cursorColor: AppColor.white,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isSecure ?? false,
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: AppColor.lightGray,
            contentPadding: const EdgeInsets.all(10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintStyle: AppTextStyle.subTitle
                .copyWith(color: AppColor.white.withOpacity(0.5))),
      ),
    );
  }
}

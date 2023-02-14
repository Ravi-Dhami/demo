import 'package:demo_task/utils/constant/color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget? text;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? isGoogleIcon;
  final bool? isArrowIcon;
  final VoidCallback? onTap;

  const Button(
      {Key? key,
      this.text,
      this.prefixIcon,
      this.suffixIcon,
      this.isGoogleIcon = false,
      this.isArrowIcon = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            border: Border.all(color: AppColor.gray),
            color: AppColor.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isGoogleIcon == true
                ? SizedBox(
                    height: 18,
                    width: 18,
                    child: Image.asset('assets/images/google.png'))
                : const SizedBox(),
            Container(
              child: text,
            ),
            isArrowIcon == true
                ? const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 15,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

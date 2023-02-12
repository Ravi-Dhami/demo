import 'package:demo_task/utils/constant/color.dart';
import 'package:demo_task/utils/constant/text_style.dart';
import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final String? name;
  final String? age;
  final String? city;
  const DataContainer({Key? key, this.name, this.age, this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 20),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.gray),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              name ?? '',
              style: AppTextStyle.title.copyWith(
                fontSize: 15,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              city ?? '',
              style: AppTextStyle.title.copyWith(
                color: Colors.black.withOpacity(0.6),
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              age ?? '',
              style: AppTextStyle.title
                  .copyWith(color: Colors.black.withOpacity(0.6), fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

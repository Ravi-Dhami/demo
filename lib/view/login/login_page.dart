import 'package:demo_task/utils/constant/color.dart';
import 'package:demo_task/utils/constant/string.dart';
import 'package:demo_task/utils/constant/text_style.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/c_textfield.dart';
import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _loginFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 30),
                  child: Text(
                    AppString.loginIn.toString(),
                    style: AppTextStyle.subTitle
                        .copyWith(color: AppColor.lightGray, fontSize: 20),
                  ),
                ),
                Text(
                  AppString.userName.toString(),
                  style: AppTextStyle.subTitle
                      .copyWith(color: AppColor.lightGray, fontSize: 15),
                ),
                CommonField(
                  hintText: AppString.userName,
                  validator: (val) {
                    if ((val!.isEmpty) || val.length <= 10) {
                      return 'enter at least 10 characters';
                    }
                  },
                ),
                Text(
                  AppString.password.toString(),
                  style: AppTextStyle.subTitle
                      .copyWith(color: AppColor.lightGray, fontSize: 15),
                ),
                CommonField(
                  hintText: AppString.password,
                  isSecure: true,
                  validator: (val) {
                    Pattern pattern =
                        r"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$";
                    RegExp regex = RegExp(pattern.toString());
                    if (val!.isEmpty || (!regex.hasMatch(val))) {
                      return 'Enter Valid Password';
                    }
                  },
                ),
                InkWell(
                  onTap: () {
                    if (_loginFormKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('complete')));
                    }
                  },
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          color: AppColor.lightGray,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        AppString.loginIn.toString(),
                        style: AppTextStyle.subTitle.copyWith(fontSize: 15),
                      )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

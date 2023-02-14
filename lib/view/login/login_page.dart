import 'package:demo_task/utils/constant/color.dart';
import 'package:demo_task/utils/constant/string.dart';
import 'package:demo_task/utils/constant/text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/widgets/button.dart';
import '../../utils/widgets/c_textfield.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Consumer<LoginController>(builder: (context, loginController, child) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: loginController.loginFormKey,
              child: SingleChildScrollView(
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
                      controller: loginController.nameController,
                      hintText: AppString.userName,
                      validator: (val) {
                        if ((val!.isEmpty) || val.length <= 10) {
                          return 'enter at least 10 characters';
                        }
                        return null;
                      },
                    ),
                    Text(
                      AppString.password.toString(),
                      style: AppTextStyle.subTitle
                          .copyWith(color: AppColor.lightGray, fontSize: 15),
                    ),
                    CommonField(
                      controller: loginController.passwordController,
                      hintText: AppString.password,
                      isSecure: true,
                      validator: (val) {
                        Pattern pattern =
                            r"^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{7,}$";
                        RegExp regex = RegExp(pattern.toString());
                        if (val!.isEmpty || (!regex.hasMatch(val))) {
                          return 'Enter Valid Password';
                        }
                        return null;
                      },
                    ),
                    InkWell(
                      onTap: () {
                        if (loginController.loginFormKey.currentState!
                            .validate()) {
                          loginController.signIn(context);

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
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Button(
                          onTap: () {
                            loginController.googleSignIn(context);
                          },
                          isGoogleIcon: true,
                          text: Text(
                            AppString.conWithGoogle.toString(),
                            style: AppTextStyle.title
                                .copyWith(fontSize: 15, color: Colors.black),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

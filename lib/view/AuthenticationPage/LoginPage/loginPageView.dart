import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/Common/commonFun.dart';
import 'package:health_box_opd/Widgets/commonButton.dart';
import 'package:health_box_opd/Widgets/commonTextField.dart';
import 'package:health_box_opd/view/AuthenticationPage/SignupPage/signupPageView.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// App icon
            Center(
              child: Image.asset(
                'assets/healthboxOPD.png',
                height: 80,
              ),
            ),
            const SizedBox(height: 24),

            /// login text
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            /// login sub text
            const Text(
              'login to your account to continue',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16),

            /// Email textfield
            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CommonTextField(
                textEditingController: _emailController,
                fillColor: Colors.grey.withOpacity(.1),
                labeltext: 'Enter Email',
                onClickButton: (val) {},
              ),
            ),
            SizedBox(height: getScreenHeight(context) * 0.03),

            /// Password textfield
            ValueListenableBuilder<bool>(
              valueListenable: isPasswordVisible,
              builder: (context, value, child) {
                return Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: CommonTextField(
                    textEditingController: _passwordController,
                    fillColor: Colors.grey.withOpacity(.1),
                    labeltext: 'Enter Password',
                    passwordVisible: true,
                    isPassField: true,
                    isPassIconChange: isPasswordVisible.value,
                    onClickButton: (val) {
                      isPasswordVisible.value = val;
                    },
                  ),
                );
              },
            ),
            SizedBox(height: getScreenHeight(context) * 0.04),

            /// Login button
            CommonButton(
              buttonText: 'Login',
              onPressed: () {},
              height: 45,
            ),
            SizedBox(height: getScreenHeight(context) * 0.04),

            /// Don't hava an account text & etc
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SingupPageView(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.appThemeColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

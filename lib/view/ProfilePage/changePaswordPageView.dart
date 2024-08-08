import 'package:flutter/material.dart';
import 'package:health_box_opd/Widgets/commonButton.dart';
import 'package:health_box_opd/Widgets/commonTextField.dart';

class ChangePasswordPageView extends StatefulWidget {
  const ChangePasswordPageView({super.key});

  @override
  State<ChangePasswordPageView> createState() => _ChangePasswordPageViewState();
}

class _ChangePasswordPageViewState extends State<ChangePasswordPageView> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Old Password
          const Text(
            'Old Password',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: CommonTextField(
              textEditingController: _oldPasswordController,
              fillColor: Colors.transparent,
              labeltext: 'Enter your old password',
              onClickButton: (val) {},
            ),
          ),

          /// New Password
          const Text(
            'New Password',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: CommonTextField(
              textEditingController: _newPasswordController,
              fillColor: Colors.transparent,
              labeltext: 'Enter your new password',
              onClickButton: (val) {},
            ),
          ),

          /// Confirm Password
          const Text(
            'Confirm Password',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Container(
            width: double.infinity,
            height: 45,
            margin: const EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: Colors.grey.withOpacity(.4),
              ),
            ),
            child: CommonTextField(
              textEditingController: _confirmPasswordController,
              fillColor: Colors.transparent,
              labeltext: 'Enter your confirm password',
              onClickButton: (val) {},
            ),
          ),

          /// Save changes Button
          CommonButton(
            buttonText: 'Save Changes',
            width: 180,
            onPressed: () {},
            fontWeight: FontWeight.bold,
            color: const Color(0xFF09e5ab),
          ),
        ],
      ),
    );
  }
}

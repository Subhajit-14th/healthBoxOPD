import 'package:flutter/material.dart';
import 'package:health_box_opd/Widgets/commonButton.dart';
import 'package:health_box_opd/view/ClinicProfilePage/ClinicReviewPage/clinicReviewWidgetView.dart';

class ClinicReviewPageView extends StatefulWidget {
  const ClinicReviewPageView({super.key, required this.opdCenterName});

  final String opdCenterName;

  @override
  State<ClinicReviewPageView> createState() => _ClinicReviewPageViewState();
}

class _ClinicReviewPageViewState extends State<ClinicReviewPageView> {
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? Container()
        : Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Clinic Review Section
                const ClinicReviewWidgetView(),
                const SizedBox(height: 16),

                /// Review Section Text
                RichText(
                  text: TextSpan(
                    text: 'Write a review for ',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: widget.opdCenterName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                /// Register and login
                Row(
                  children: [
                    CommonButton(
                      width: 120,
                      height: 40,
                      buttonText: 'Register',
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    CommonButton(
                      width: 120,
                      height: 40,
                      buttonText: 'Login',
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

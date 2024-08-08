import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';

class SpecialititesWidget extends StatefulWidget {
  final String? name;

  const SpecialititesWidget({super.key, this.name});

  @override
  State<SpecialititesWidget> createState() => _SpecialititesWidgetState();
}

class _SpecialititesWidgetState extends State<SpecialititesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColor.appThemeColor.withOpacity(.2),
            child: Image.asset(
              'assets/hearticon.png',
              height: 45,
              width: 45,
              color: AppColor.appThemeColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              '${widget.name}',
              style: TextStyle(
                color: AppColor.appThemeColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

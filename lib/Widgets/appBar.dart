import 'package:flutter/material.dart';
import 'package:health_box_opd/utils/appColor.dart';
import 'package:health_box_opd/utils/commonFun.dart';
import 'package:health_box_opd/widgets/commonTextField.dart';

PreferredSizeWidget appBarHome(
    BuildContext context, String text, int notificationTotal) {
  return AppBar(
    titleSpacing: 0,
    centerTitle: false,
    elevation: 0,
    toolbarHeight: 160,
    backgroundColor: AppColor.appThemeColor,
    flexibleSpace: Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_rounded,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getScreenWidth(context) / 1.35,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CommonTextField(
                      suffixIcon: const Icon(
                        Icons.search_rounded,
                      ),
                      onClickButton: (val) {},
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_alt_outlined,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

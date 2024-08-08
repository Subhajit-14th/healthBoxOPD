import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/Common/commonFun.dart';

class ContactUsPageView extends StatefulWidget {
  const ContactUsPageView({super.key});

  @override
  State<ContactUsPageView> createState() => _ContactUsPageViewState();
}

class _ContactUsPageViewState extends State<ContactUsPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appThemeColor,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu_rounded,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Healthbox OPD',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Let\'s make',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'Something great!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Have a project in mind?',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'Talk to us!',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 16),

            /// Location part
            Container(
              width: getScreenWidth(context),
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: AppColor.appThemeColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.add_location_alt_rounded,
                    color: AppColor.appThemeColor,
                    size: 28,
                  ),
                  Text(
                    'Location',
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '3556 Beech Street, San Francisco, California',
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Phone number part
            Container(
              width: getScreenWidth(context),
              padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: AppColor.appThemeColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.add_ic_call_rounded,
                    color: AppColor.appThemeColor,
                    size: 28,
                  ),
                  Text(
                    'Phone',
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '+ 1315 369 5943',
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Email part
            Container(
              width: getScreenWidth(context),
              padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
              decoration: BoxDecoration(
                color: AppColor.appThemeColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.email_rounded,
                    color: AppColor.appThemeColor,
                    size: 28,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'healthboxopd@gmail.com',
                    maxLines: 2,
                    style: TextStyle(
                      color: AppColor.appThemeColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

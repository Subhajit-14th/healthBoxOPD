import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/view/ProfilePage/changePaswordPageView.dart';
import 'package:health_box_opd/view/ProfilePage/profileDashBoardPageView.dart';
import 'package:health_box_opd/view/ProfilePage/profileSettingsPageView.dart';
import 'package:health_box_opd/view/ProfilePage/profileSupportsPageView.dart';

class UserProfilePageView extends StatefulWidget {
  const UserProfilePageView({super.key});

  @override
  State<UserProfilePageView> createState() => _UserProfilePageViewState();
}

class _UserProfilePageViewState extends State<UserProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.appThemeColor,
          title: const Text(
            'Healthbox OPD',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          automaticallyImplyLeading: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                /// Profile Photo
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage('assets/womendoctorOne.png'),
                ),
                const SizedBox(height: 16),

                /// User Name
                const Text(
                  'Example User',
                  maxLines: 4,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),

                /// Date of birth
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cake,
                      size: 20,
                      color: Colors.black.withOpacity(.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '11 june 2024, 0 Years Old',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                /// Blood Group
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 20,
                      color: Colors.black.withOpacity(.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Blood Group: A+',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                /// ID Card
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.badge,
                        size: 20, color: Colors.black.withOpacity(.6)),
                    const SizedBox(width: 4),
                    Text(
                      'Id: 15872513',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.6),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Tab Bar
                TabBar(
                  dividerColor: Colors.black.withOpacity(.1),
                  labelStyle: const TextStyle(fontSize: 14),
                  indicatorColor: AppColor.appThemeColor,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  unselectedLabelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  tabs: [
                    Tab(
                      icon: Text(
                        'Dashboard',
                        style: TextStyle(
                          color: AppColor.appThemeColor,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Profile Settings',
                        style: TextStyle(
                          color: AppColor.appThemeColor,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Book Appointment',
                        style: TextStyle(
                          color: AppColor.appThemeColor,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Supports',
                        style: TextStyle(
                          color: AppColor.appThemeColor,
                        ),
                      ),
                    ),
                    Tab(
                      icon: Text(
                        'Change Password',
                        style: TextStyle(
                          color: AppColor.appThemeColor,
                        ),
                      ),
                    ),
                  ],
                ),

                /// Tab bar View
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.84,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const ProfileDashBoardPageView(),
                      const ProfileSettingsPageView(),
                      Container(),
                      const ProfileSupportsPageView(),
                      const ChangePasswordPageView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

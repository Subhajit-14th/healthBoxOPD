import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_box_opd/utils/appColor.dart';
import 'package:health_box_opd/utils/commonFun.dart';
import 'package:health_box_opd/view/AbountPage/aboutPageView.dart';
import 'package:health_box_opd/view/AuthenticationPage/LoginPage/loginPageView.dart';
import 'package:health_box_opd/view/ConditionAndPolicy/PrivacyPolicyPage/privacyPolicyPageView.dart';
import 'package:health_box_opd/view/ConditionAndPolicy/Terms&ConditionPage/terms&ConditionPageView.dart';
import 'package:health_box_opd/view/ContactUsPage/contactUsPageView.dart';
import 'package:health_box_opd/view/HomePage/homePageView.dart';
import 'package:health_box_opd/view/ProfilePage/userProfilePageView.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int selectedIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.appThemeColor,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: AppColor.appThemeColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              /// Drawer heading
              SizedBox(
                width: getScreenWidth(context),
                height: 100,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/healthboxOPD.png',
                        // height: 80,
                        width: 180,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Home bar
              ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                title: const Text('Home',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Clinics bar
              ListTile(
                leading: const Icon(
                  Icons.health_and_safety_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Clinics',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Doctors bar
              ListTile(
                leading: const Icon(
                  Icons.person_add_alt_1_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Doctors',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Patients bar
              ListTile(
                leading: const Icon(
                  Icons.personal_injury_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Patients',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Admin bar
              ListTile(
                leading: const Icon(
                  Icons.admin_panel_settings_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 1;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Blogs bar
              ListTile(
                leading: const Icon(
                  Icons.speaker_notes_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Blogs',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 2;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Contact Us bar
              ListTile(
                leading: const Icon(
                  Icons.wifi_calling_3_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  selectedIndex = 3;
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Privacy policy bar
              ListTile(
                leading: const Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  /*Navigator.pop(context);
                  selectedIndex = 3;*/
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPageView(),
                    ),
                  );
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Terms and condition bar
              ListTile(
                leading: const Icon(
                  Icons.keyboard_double_arrow_right_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Terms and condition',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  /*Navigator.pop(context);
                  selectedIndex = 3;*/
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermsAndConditionPageView(),
                    ),
                  );
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// Profile Image
              ListTile(
                leading: const Icon(
                  Icons.person_2_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfilePageView(),
                    ),
                  );
                  setState(() {});
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(color: Colors.grey),
              ),

              /// login/singup
              ListTile(
                leading: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                title: const Text(
                  'Login/Signup',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPageView(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: [
          const HomePageView(),
          const HomePageView(),
          const AboutPageView(),
          const ContactUsPageView(),
        ][selectedIndex],
        bottomNavigationBar: selectedIndex != 3
            ? Container(
                height: 60,
                padding: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  color: AppColor.appThemeColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        selectedIndex = 0;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: selectedIndex == 0
                                  ? Colors.blueGrey
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.event_available_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Booking',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedIndex = 1;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: selectedIndex == 1
                                  ? Colors.blueGrey
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'Home',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        selectedIndex = 2;
                        setState(() {});
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 2, bottom: 2, left: 14, right: 14),
                            decoration: BoxDecoration(
                              color: selectedIndex == 2
                                  ? Colors.blueGrey
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.person_rounded,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            'About',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}

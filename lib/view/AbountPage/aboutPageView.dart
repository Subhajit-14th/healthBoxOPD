import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/Common/commonFun.dart';
import 'package:health_box_opd/Widgets/aboutLatestBlogWidget.dart';
import 'package:health_box_opd/model/topDoctorDummyModel.dart';

import '../../Widgets/aboutJustForYouWidget.dart';

class AboutPageView extends StatefulWidget {
  const AboutPageView({super.key});

  @override
  State<AboutPageView> createState() => _AboutPageViewState();
}

class _AboutPageViewState extends State<AboutPageView> {
  List<TopDoctorModel> doctorDetails = [
    TopDoctorModel(
      image:
      'https://media.istockphoto.com/id/177373093/photo/indian-male-doctor.jpg?s=612x612&w=0&k=20&c=5FkfKdCYERkAg65cQtdqeO_D0JMv6vrEdPw3mX1Lkfg=',
      doctorName: 'Darren Elder',
      doctorSpecialist: 'Surgery',
      rating: '4.0',
      openTime: '10:00 AM',
      closeTime: '5:00 PM',
    ),
    TopDoctorModel(
      image:
      'https://i.pinimg.com/736x/b9/97/a5/b997a530822d0f2c03259070d4590d45.jpg',
      doctorName: 'Ruby Perrin',
      doctorSpecialist: 'Cardiologist',
      rating: '5.0',
      openTime: '10:00 AM',
      closeTime: '5:00 PM',
    ),
    TopDoctorModel(
      image:
      'https://t3.ftcdn.net/jpg/06/48/69/42/360_F_648694278_haC94bdL26EedqLMIbMpLACqzxwuvq4f.jpg',
      doctorName: 'Deborah Angle',
      doctorSpecialist: 'Cardiologist',
      rating: '3.5',
      openTime: '10:00 AM',
      closeTime: '5:00 PM',
    ),
  ];


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
      body:  Column(
        children: [
          /// heading text about
          const Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Latest Blog',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          /// Latest blog listview
          SizedBox(
            height: 150,
            width: getScreenWidth(context),
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 24,right: 24),
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return const AboutLatestBlogWidget();
            },),
          ),

          /// About just for you row
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Just For You',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: AppColor.appThemeColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          /// About just for you Listview
          Expanded(
            child: ListView.builder(
              itemCount: doctorDetails.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(left: 24, right: 24, top: 16),
              itemBuilder: (context, index) {
                return AboutJustForYouWidget(
                  doctorImage: doctorDetails[index].image,
                  doctorName: doctorDetails[index].doctorName,
                  doctorSpecialist: doctorDetails[index].doctorSpecialist,
                  rating: doctorDetails[index].rating,
                  openTime: doctorDetails[index].openTime,
                  closeTime: doctorDetails[index].closeTime,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

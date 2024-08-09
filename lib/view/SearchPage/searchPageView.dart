import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/model/searchItemsModel.dart';
import 'package:health_box_opd/view/SearchPage/searchPageListWidget.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key, this.placeName, this.specialist});

  final String? placeName;
  final String? specialist;

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  List<SearchItemsModel> searchItems = [
    SearchItemsModel(
      imageUrl: 'https://healthboxopd.com/gallery_images/1712661304Blue%20Modern%20Online%20Doctor%20Consultation%20Instagram%20Post.png',
      clinicTitle: 'HB OPD Center Bishnupur , Manipiur',
      clinicSubtitle: 'At this center we are offering OPD facilty of General Practice/Family Medicine Clinic, Internal Medicine Clinic, Predict Clinic',
      placeName: 'Bishnupur, Manipur, India',
      rating: '0',
    ),
    SearchItemsModel(
      imageUrl: 'https://healthboxopd.com/gallery_images/1712661603Robotic%20Surgery(2).png',
      clinicTitle: 'HB OPD Center Medinipur (WB)',
      clinicSubtitle: 'At this center we are offering OPD facilty of General Practice/Family Medicine Clinic, Internal Medicine Clinic, Predict Clinic',
      placeName: 'Medinipur, West Bengal, India',
      rating: '1',
    ),
    SearchItemsModel(
      imageUrl: 'https://healthboxopd.com/gallery_images/1712661449Medical%20Services%20Online%20Doctor%20Consultation%20Instagram%20Post.png',
      clinicTitle: 'HB OPD Center Lucknow',
      clinicSubtitle: 'At this center we are offering OPD facilty of General Practice/Family Medicine Clinic, Internal Medicine Clinic, Predict Clinic',
      placeName: 'Gomti Nagar, Lucknow, Uttar Pradesh, India',
      rating: '0',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        children: [
          /// Search items results details
          Container(
            height: 60,
            width: double.infinity,
            color: const Color(0xFF15558d),
            padding: const EdgeInsets.only(left: 16, right: 16,top: 4),
            child: Text(
              '3 matches found for : ${widget.specialist} In ${widget.placeName}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          /// Search Items
          Expanded(
            child: ListView.builder(
              itemCount: searchItems.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              itemBuilder: (context, index) {
              return  SearchPageListWidget(
                imageUrl: searchItems[index].imageUrl ?? '',
                placeName: searchItems[index].placeName ?? '',
                clinicTitle: searchItems[index].clinicTitle ?? '',
                clinicSubTitle: searchItems[index].clinicSubtitle ?? '',
                rating: searchItems[index].rating ?? '',
                specialistName: widget.specialist ?? '',
              );
            },),
          ),
        ],
      ),
    );
  }
}

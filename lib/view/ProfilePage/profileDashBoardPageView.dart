import 'package:flutter/material.dart';
import 'package:health_box_opd/models/allMedicalRecordsItemsModel.dart';
import 'package:health_box_opd/models/currentStatusItemsModel.dart';

class ProfileDashBoardPageView extends StatefulWidget {
  const ProfileDashBoardPageView({super.key});

  @override
  State<ProfileDashBoardPageView> createState() =>
      _ProfileDashBoardPageViewState();
}

class _ProfileDashBoardPageViewState extends State<ProfileDashBoardPageView> {
  List<CurrentStatusItemsModel> currentStatusItems = [
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/heart_rate.png',
      statusName: 'Heart Rate',
      status: '---',
      statusSuffixName: 'bpm',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/body_temparture.png',
      statusName: 'Body Temperature',
      status: '---',
      statusSuffixName: 'c',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/glucose _level.png',
      statusName: 'Glucose Level',
      status: '---',
      statusSuffixName: '',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/blood_pressure.png',
      statusName: 'Blood Pressure',
      status: '---',
      statusSuffixName: 'mg/dl',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/BMI_status.png',
      statusName: 'BMI Status',
      status: '---',
      statusSuffixName: 'kg/m2',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/FBC_status.png',
      statusName: 'FBC Status',
      status: '---',
      statusSuffixName: 'g/L',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/body_weignt.png',
      statusName: 'Body Weignt',
      status: '---',
      statusSuffixName: 'kg',
    ),
    CurrentStatusItemsModel(
      itemImage: 'assets/app_items_logo/pulse_rate.png',
      statusName: 'Pulse Rate',
      status: '---',
      statusSuffixName: 'bps',
    ),
  ];
  List<AllMedicalRecordsModel> allMedicalRecordsItems = [
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'Heart Rate Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_heart-rate.png',
      boxColor: const Color(0xFF6a5dee),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'Body Temperature Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_medical.png',
      boxColor: const Color(0xFFfe9286),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'Glucose Level Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_glucose-meter.png',
      boxColor: const Color(0xFF8ec4ff),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'Blood Pressure Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_blood-pressure.png',
      boxColor: const Color(0xFFffa775),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'BMI Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all-medical_records_bathroom-scale.png',
      boxColor: const Color(0xFF6a5dee),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'FBC Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_blood-count-test.png',
      boxColor: const Color(0xFFfe9286),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'Body Weight Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_weight-management.png',
      boxColor: const Color(0xFF8ec4ff),
    ),
    AllMedicalRecordsModel(
      allMedicalRecordsItemsName: 'Pulse Rate Status',
      allMedicalRecordsItemsImage:
          'assets/app_items_logo/all_medical_records_heart-beat.png',
      boxColor: const Color(0xFFffa775),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Current heading
          const Text(
            'Current Status',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          /// Current status items
          Expanded(
            child: ListView.builder(
              itemCount: currentStatusItems.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              // padding: const EdgeInsets.only(bottom: 16),
              itemBuilder: (context, index) {
                return showCurrentStatusWidget(
                  itemsImage: currentStatusItems[index].itemImage,
                  statusName: currentStatusItems[index].statusName,
                  status: currentStatusItems[index].status,
                  statusSuffixName: currentStatusItems[index].statusSuffixName,
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          /// All Medical Records
          const Text(
            'All Medical Records',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          /// All Medical Records Items
          Expanded(
            child: ListView.builder(
              itemCount: allMedicalRecordsItems.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              // padding: const EdgeInsets.only(bottom: 16),
              itemBuilder: (context, index) {
                return showAllMedicalRecordsWidget(
                  allMedicalRecordsItemsName:
                      allMedicalRecordsItems[index].allMedicalRecordsItemsName,
                  allMedicalRecordsItemsImage:
                      allMedicalRecordsItems[index].allMedicalRecordsItemsImage,
                  boxColor: allMedicalRecordsItems[index].boxColor,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  /// Current Status Widget
  Widget showCurrentStatusWidget(
      {required String itemsImage,
      required String statusName,
      required String status,
      required String statusSuffixName}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(.2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(itemsImage, height: 50, width: 50, fit: BoxFit.fill),
          const SizedBox(height: 16),
          Text(
            statusName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                status,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                statusSuffixName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// All Medical Records Widget
  Widget showAllMedicalRecordsWidget(
      {required String allMedicalRecordsItemsName,
      required String allMedicalRecordsItemsImage,
      required Color boxColor}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(.2),
        ),
      ),
      child: Column(
        children: [
          Text(
            allMedicalRecordsItemsName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(allMedicalRecordsItemsImage,
              height: 50, width: 50, fit: BoxFit.fill),
        ],
      ),
    );
  }
}

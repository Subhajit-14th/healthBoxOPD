import 'package:flutter/material.dart';

class ClinicOverviewPageView extends StatelessWidget {
  const ClinicOverviewPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Us',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'At this center we are offering OPD facility of General Practice/Family Medicine Clinic, Internal Medicine Clinic, Pediatric Clinic , Obstetrics and Gynecology (OB/GYN), Cardiology Clinic, Dental Clinic, Orthopedic Clinic, ENT (Ear, Nose, and Throat) Clinic, Ophthalmology Clinic, Cancer Clinic and many more.',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}

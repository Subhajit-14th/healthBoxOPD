import 'package:flutter/material.dart';
import 'package:health_box_opd/utils/appColor.dart';
import 'package:health_box_opd/widgets/commonButton.dart';
import 'package:health_box_opd/widgets/star_rating.dart';
import 'package:health_box_opd/view/AppointmentPage/appointmentPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicBusinessHourPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicOverviewPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicReviewPageView.dart';

class ClinicProfilePageView extends StatefulWidget {
  const ClinicProfilePageView(
      {super.key,
      required this.imageUrl,
      required this.clinicTitle,
      required this.clinicSubtitle,
      required this.placeName,
      required this.rating,
      required this.specialistName});

  final String imageUrl;
  final String clinicTitle;
  final String clinicSubtitle;
  final String placeName;
  final String rating;
  final String specialistName;

  @override
  State<ClinicProfilePageView> createState() => _ClinicProfilePageViewState();
}

class _ClinicProfilePageViewState extends State<ClinicProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              /// Clinic Image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    widget.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Clinic Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.clinicTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Clinic Subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.clinicSubtitle,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Specialist Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/brainImage.png',
                      height: 15,
                      width: 15,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.specialistName,
                      maxLines: 4,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Star rating
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StarRating(
                      rating: widget.rating == '1' ? 5 : 0,
                      // double.parse(widget.course_reviews?.data![index].rating.toString() ?? ''),
                      color: Colors.amber,
                      iconSize: 16,
                      onRatingChanged: (double rating) {},
                    ),
                    Text(
                      '(${widget.rating})',
                      maxLines: 4,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Placename
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.grey),
                    Text(
                      widget.placeName,
                      maxLines: 4,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Small image
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    widget.imageUrl,
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// Feedback Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.feedback_outlined,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '0',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Feedback',
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Place Name
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.location_on_rounded, color: Colors.black),
                    Text(
                      widget.placeName,
                      maxLines: 4,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              /// Book Appointment
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: CommonButton(
                  buttonText: 'BOOK APPOINTMENT',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AppointmentPageView(
                                  clinicImage: widget.imageUrl,
                                  clinicName: widget.clinicTitle,
                                  clinicPlace: widget.placeName,
                                )));
                  },
                ),
              ),
              const SizedBox(height: 16),

              /// Tab Bar
              TabBar(
                dividerColor: Colors.transparent,
                labelStyle: const TextStyle(fontSize: 14),
                indicatorColor: AppColor.appThemeColor,
                unselectedLabelColor: Colors.black,
                unselectedLabelStyle: const TextStyle(
                  color: Colors.black,
                ),
                tabs: [
                  Tab(
                    icon: Text(
                      'Overview',
                      style: TextStyle(
                        color: AppColor.appThemeColor,
                      ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Review',
                      style: TextStyle(
                        color: AppColor.appThemeColor,
                      ),
                    ),
                  ),
                  Tab(
                    icon: Text(
                      'Business Hours',
                      style: TextStyle(
                        color: AppColor.appThemeColor,
                      ),
                    ),
                  ),
                ],
              ),

              /// Tabbar View
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: TabBarView(
                  children: [
                    const ClinicOverviewPageView(),
                    ClinicReviewPageView(
                      opdCenterName: widget.clinicTitle,
                    ),
                    const ClinicBusinessHourPageView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:health_box_opd/Widgets/commonButton.dart';
import 'package:health_box_opd/Widgets/star_rating.dart';
import 'package:health_box_opd/view/AppointmentPage/appointmentPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicProfilePageView.dart';

class SearchPageListWidget extends StatefulWidget {
  final String imageUrl;
  final String clinicTitle;
  final String clinicSubTitle;
  final String placeName;
  final String rating;
  final String specialistName;

  const SearchPageListWidget(
      {super.key,
      required this.imageUrl,
      required this.clinicTitle,
      required this.clinicSubTitle,
      required this.placeName,
      required this.rating,
      required this.specialistName});

  @override
  State<SearchPageListWidget> createState() => _SearchPageListWidgetState();
}

class _SearchPageListWidgetState extends State<SearchPageListWidget> {
  final String placeName = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 14, bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          /// Clinic Information
          Row(
            children: [
              /// Image
              Expanded(
                flex: 1,
                child: Image.network(
                  widget.imageUrl,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(width: 14),

              /// Clinic details
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Clinic Title
                    Text(
                      widget.clinicTitle,
                      style: TextStyle(
                        color: AppColor.appThemeColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),

                    /// Clinic Subtitle
                    Text(
                      widget.clinicSubTitle,
                      maxLines: 4,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 6),

                    /// Specialist name
                    Row(
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
                    const SizedBox(height: 6),

                    /// Star Rating
                    Row(
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
                    const SizedBox(height: 6),

                    /// Place Name
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded,
                            color: Colors.grey),
                        Expanded(
                          child: Text(
                            widget.placeName,
                            maxLines: 4,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: CommonButton(
                  buttonText: 'VIEW PROFILE',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClinicProfilePageView(
                            imageUrl: widget.imageUrl,
                            clinicTitle: widget.clinicTitle,
                            clinicSubtitle: widget.clinicSubTitle,
                            placeName: widget.placeName,
                            rating: widget.rating,
                            specialistName: widget.specialistName,
                          ),
                        ));
                  },
                  isBorder: true,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
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
            ],
          ),
        ],
      ),
    );
  }
}

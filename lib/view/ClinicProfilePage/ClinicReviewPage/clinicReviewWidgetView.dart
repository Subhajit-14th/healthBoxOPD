import 'package:flutter/material.dart';
import 'package:health_box_opd/widgets/star_rating.dart';

class ClinicReviewWidgetView extends StatefulWidget {
  const ClinicReviewWidgetView({super.key});

  @override
  State<ClinicReviewWidgetView> createState() => _ClinicReviewWidgetViewState();
}

class _ClinicReviewWidgetViewState extends State<ClinicReviewWidgetView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// Image
          const CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                'https://healthboxopd.com/assets/img/patients/patient.jpg'),
          ),
          const SizedBox(width: 16),

          /// user review details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// User name
                const Text(
                  'SAMEER',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// user review time
                const Text(
                  'Reviewed 2 months ago',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),

                /// user rating status
                StarRating(
                  rating: 5,
                  starCount: 5,
                  // double.parse(widget.course_reviews?.data![index].rating.toString() ?? ''),
                  color: Colors.amber,
                  iconSize: 16,
                  onRatingChanged: (double rating) {},
                ),

                /// user first review
                const Text(
                  'Greate Service by HEalthbox',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                /// user review
                const Text(
                  'I was suffering from long time cough & fever. Now am completely ok',
                  maxLines: 4,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

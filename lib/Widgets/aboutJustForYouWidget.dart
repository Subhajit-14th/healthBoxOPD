import 'package:flutter/material.dart';
import 'package:health_box_opd/Common/appColor.dart';

class AboutJustForYouWidget extends StatefulWidget {
  final String doctorImage;
  final String doctorName;
  final String doctorSpecialist;
  final String rating;
  final String openTime;
  final String closeTime;

  const AboutJustForYouWidget(
      {super.key,
        required this.doctorImage,
        required this.doctorName,
        required this.doctorSpecialist,
        required this.rating,
        required this.openTime,
        required this.closeTime});

  @override
  State<AboutJustForYouWidget> createState() => _AboutJustForYouWidgetState();
}

class _AboutJustForYouWidgetState extends State<AboutJustForYouWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(left: 14, right: 14, top: 14,bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Image.network(widget.doctorImage,height: 110,width: 90, fit: BoxFit.fill,)),
          const SizedBox(width: 14),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Doctor Name
                Text(
                  widget.doctorName,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                /// Doctor specialist
                Text(
                  widget.doctorSpecialist,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                /// Tap for details text
                const Text(
                  'Tap For More Details',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 4),
                /// Rating and time
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.rating,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      Icons.timelapse_rounded,
                      color: AppColor.appThemeColor,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${widget.openTime} To ${widget.closeTime}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
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
    );
  }
}

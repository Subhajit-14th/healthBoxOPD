import 'package:flutter/material.dart';

class AboutLatestBlogWidget extends StatefulWidget {
  const AboutLatestBlogWidget({super.key});

  @override
  State<AboutLatestBlogWidget> createState() => _AboutLatestBlogWidgetState();
}

class _AboutLatestBlogWidgetState extends State<AboutLatestBlogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          image: NetworkImage(
            'https://img.freepik.com/free-photo/front-view-smiley-doctor-clinic_23-2149726935.jpg',
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(left: 14, bottom: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.5),
            ),
            child: Text(
              'Doctors are the only people who have a through understanding...',
              maxLines: 4,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

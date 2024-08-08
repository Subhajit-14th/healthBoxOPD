import 'package:flutter/material.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final double iconSize;

  StarRating({
    this.starCount = 5,
    this.rating = .0,
    required this.onRatingChanged,
    required this.color,
    this.iconSize = 12,
  });

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        Icons.star_border,
        size: iconSize,
        color: Colors.black,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        size: iconSize,
        color: color,
      );
    } else {
      icon = Icon(
        Icons.star,
        size: iconSize,
        color: color,
      );
    }
    return InkResponse(
      radius: 10,
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        starCount,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: buildStar(context, index),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:health_box_opd/utils/appColor.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.height,
    this.width,
    this.color,
    this.fontWeight,
    this.isBorder,
  });

  final String buttonText;
  final Function() onPressed;
  final double? height;
  final double? width;
  final Color? color;
  final FontWeight? fontWeight;
  final bool? isBorder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height ?? 52,
        width: width ?? 380,
        decoration: BoxDecoration(
            color: color ?? AppColor.appThemeColor,
            borderRadius: BorderRadius.circular(10),
            border: isBorder ?? false
                ? Border.all(
                    color: AppColor.appThemeColor,
                    width: 2,
                  )
                : Border.all(
                    color: Colors.transparent,
                  )),
        child: Center(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              elevation: 0,
              splashFactory: NoSplash.splashFactory,
            ),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    isBorder ?? false ? AppColor.appThemeColor : Colors.white,
                fontSize: 12,
                fontFamily: 'Urbanist-Bold',
                fontWeight: fontWeight ?? FontWeight.w700,
                // height: 0.09,
                // letterSpacing: 0.20,
              ),
            ),
            /*Txt(
              txt: buttonText,
              txtColor: theme.textTheme.displayLarge?.color,
              txtSize: theme.textTheme.displayMedium?.fontSize ?? 15,
              fontWeight: theme.textTheme.displayMedium?.fontWeight,
            ),*/
          ),
        ),
      ),
    );
  }
}

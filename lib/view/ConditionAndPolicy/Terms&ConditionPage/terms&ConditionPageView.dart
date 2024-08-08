import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndContidionPageView extends StatefulWidget {
  const TermsAndContidionPageView({super.key});

  @override
  State<TermsAndContidionPageView> createState() => _TermsAndContidionPageViewState();
}

class _TermsAndContidionPageViewState extends State<TermsAndContidionPageView> {

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition (recommended for Android WebView)
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColor.appThemeColor, // Set this to light
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appThemeColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Terms And Condition",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const WebView(
        initialUrl: 'https://healthboxopd.com/terms-and-conditions',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

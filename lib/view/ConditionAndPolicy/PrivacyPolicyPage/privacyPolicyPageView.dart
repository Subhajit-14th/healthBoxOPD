import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_box_opd/Common/appColor.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyPageView extends StatefulWidget {
  const PrivacyPolicyPageView({super.key});

  @override
  State<PrivacyPolicyPageView> createState() => _PrivacyPolicyPageViewState();
}

class _PrivacyPolicyPageViewState extends State<PrivacyPolicyPageView> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition (recommended for Android WebView)
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.appThemeColor,
      ),
    );
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
          "Privacy Policy",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const WebView(
        initialUrl: 'https://healthboxopd.com/privacy-policy',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

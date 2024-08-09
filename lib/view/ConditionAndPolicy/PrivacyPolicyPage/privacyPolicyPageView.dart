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
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar or show loading indicator
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {
            // Handle HTTP errors
          },
          onWebResourceError: (WebResourceError error) {
            // Handle Web resource errors
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision
                  .prevent; // Prevent navigation to YouTube
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://healthboxopd.com/privacy-policy'));

    // Set the status bar color
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
      body: WebViewWidget(controller: controller),
    );
  }
}

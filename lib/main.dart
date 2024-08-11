import 'package:flutter/material.dart';
import 'package:health_box_opd/services/auth_services.dart';
import 'package:health_box_opd/services/router_services.dart';
import 'package:health_box_opd/view/screenRoot.dart';
import 'dart:developer';

import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  String appName = packageInfo.appName;
  String packageName = packageInfo.packageName;
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;

  log("App Name: $appName, Package Name: $packageName, Version: $version, Build Number: $buildNumber");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthServices>(create: (_) => AuthServices()),
        Provider<RouterServices>(create: (_) => RouterServices()),
      ],
      child: Consumer(builder: (context, RouterServices routerServices, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Health Box OPD',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: routerServices.goRouter,
        );
      }),
    );
  }
}

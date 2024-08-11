import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_box_opd/view/AppointmentPage/appointmentPageView.dart';
import 'package:health_box_opd/view/AuthenticationPage/LoginPage/loginPageView.dart';
import 'package:health_box_opd/view/AuthenticationPage/SignupPage/signupPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicBusinessHourPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicOverviewPageView.dart';
import 'package:health_box_opd/view/ClinicProfilePage/clinicReviewPageView.dart';
import 'package:health_box_opd/view/ConditionAndPolicy/PrivacyPolicyPage/privacyPolicyPageView.dart';
import 'package:health_box_opd/view/ConditionAndPolicy/Terms&ConditionPage/terms&ConditionPageView.dart';
import 'package:health_box_opd/view/ContactUsPage/contactUsPageView.dart';
import 'package:health_box_opd/view/HomePage/homePageView.dart';
import 'package:health_box_opd/view/ProfilePage/profileDashBoardPageView.dart';
import 'package:health_box_opd/view/ProfilePage/profileSettingsPageView.dart';
import 'package:health_box_opd/view/ProfilePage/profileSupportsPageView.dart';
import 'package:health_box_opd/view/SearchPage/searchPageView.dart';

import '../view/AbountPage/aboutPageView.dart';
import '../view/ClinicProfilePage/clinicProfilePageView.dart';

enum AppRoutes {
  about,
  appointment,
  login,
  signup,
  c_overview,
  c_profile,
  c_review,
  c_business,
  privacy,
  terms,
  contact,
  home,
  profile,
  profile_settings,
  profile_support,
  search,
}

String routeToPath(AppRoutes route) {
  switch (route) {
    case AppRoutes.about:
      return '/about';
    case AppRoutes.appointment:
      return '/appointment';
    case AppRoutes.login:
      return '/login';
    case AppRoutes.signup:
      return '/signup';
    case AppRoutes.c_overview:
      return '/c_overview';
    case AppRoutes.c_profile:
      return '/c_profile';
    case AppRoutes.c_review:
      return '/c_review';
    case AppRoutes.c_business:
      return '/c_business';
    case AppRoutes.privacy:
      return '/privacy';
    case AppRoutes.terms:
      return '/terms';
    case AppRoutes.contact:
      return '/contact';
    case AppRoutes.home:
      return '/home';
    case AppRoutes.profile:
      return '/profile';
    case AppRoutes.profile_settings:
      return '/profile_settings';
    case AppRoutes.profile_support:
      return '/profile_support';
    case AppRoutes.search:
      return '/search';
    default:
      return '/home';
  }
}

class RouterServices {
  final GoRouter _goRouter = GoRouter(
    initialLocation: routeToPath(AppRoutes.home),
    routes: [
      GoRoute(
        path: routeToPath(AppRoutes.about),
        name: 'about',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const AboutPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.appointment),
        name: 'appointment',
        pageBuilder: (context, state) {
          final Map<String, dynamic>? extraData =
              state.extra as Map<String, dynamic>?;
          final String? clinicImage = extraData?['clinicImage'] as String?;
          final String? clinicName = extraData?['clinicName'] as String?;
          final String? clinicPlace = extraData?['clinicPlace'] as String?;
          return MaterialPage(
            key: state.pageKey,
            child: AppointmentPageView(
              clinicImage: clinicImage ?? "",
              clinicName: clinicName ?? "",
              clinicPlace: clinicPlace ?? "",
            ),
          );
        },
      ),
      GoRoute(
        path: routeToPath(AppRoutes.login),
        name: 'login',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.signup),
        name: 'signup',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SingupPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.c_overview),
        name: 'c_overview',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ClinicOverviewPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.c_profile),
        name: 'c_profile',
        pageBuilder: (context, state) {
          final Map<String, dynamic>? extraData =
              state.extra as Map<String, dynamic>?;
          final String? clinicImage = extraData?['clinicImage'] as String?;
          final String? clinicName = extraData?['clinicName'] as String?;
          final String? clinicPlace = extraData?['clinicPlace'] as String?;
          return MaterialPage(
            key: state.pageKey,
            child: ClinicProfilePageView(
              imageUrl: clinicImage ?? "",
              clinicTitle: clinicName ?? "",
              clinicSubtitle: clinicPlace ?? "",
              placeName: clinicPlace ?? "",
              rating: "0",
              specialistName: '',
            ),
          );
        },
      ),
      GoRoute(
        path: routeToPath(AppRoutes.c_review),
        name: 'c_review',
        pageBuilder: (context, state) {
          final Map<String, dynamic>? extraData =
              state.extra as Map<String, dynamic>?;
          final String? opdCenterName = extraData?['opdCenterName'] as String?;
          return MaterialPage(
            key: state.pageKey,
            child: ClinicReviewPageView(
              opdCenterName: opdCenterName ?? "",
            ),
          );
        },
      ),
      GoRoute(
        path: routeToPath(AppRoutes.c_business),
        name: 'c_business',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ClinicBusinessHourPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.privacy),
        name: 'privacy',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const PrivacyPolicyPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.terms),
        name: 'terms',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const TermsAndConditionPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.contact),
        name: 'contact',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ContactUsPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.home),
        name: 'home',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomePageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.profile),
        name: 'profile',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProfileDashBoardPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.profile_settings),
        name: 'profile_settings',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProfileSettingsPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.profile_support),
        name: 'profile_support',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const ProfileSupportsPageView(),
        ),
      ),
      GoRoute(
        path: routeToPath(AppRoutes.search),
        name: 'search',
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const SearchPageView(),
        ),
      ),
    ],
  );

  GoRouter get goRouter => _goRouter;

  // RouterDelegate<Object> get routerDelegate => _goRouter.routerDelegate;
  // RouteInformationParser<Object> get routeInformationParser =>
  //     _goRouter.routeInformationParser;
  // RouteInformationProvider get routeInformationProvider =>
  //     _goRouter.routeInformationProvider;
}

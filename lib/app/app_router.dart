import './splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String splashRoute = '/splashscreen';
  static const String adminHomeRoute = '/adminhomescreen';
  static const String sendNotificationsRoute = '/sendnotifications';
  static const String notificationsRoute = '/notifications';
  static const String boardingDetailsScreenRoute = '/boardingdetailsscreen';
  static const String userDetailsFormScreenRoute = '/userdetailsformscreen';
  static const String otpPhoneNumberScreenRoute = '/otpphonenumberscreen';
  static const String otpInputScreenRoute = '/otpinputscreen';
  static const String nicUploadScreenRoute = '/nicuploadscreen';
  static const String paymentHistoryScreenRoute = '/paymenthistoryscreen';
  static const String userProfileScreenRoute = '/userprofilescreen';
  static const String userMainScreenRoute = '/usermainscreen';
  static const String usersListScreenRoute = '/userslistscreen';
  static const String bottomNavigationRoute = '/bottomnavigation';
  static const String paymentUploadScreenRoute = '/uploadpaymentscreen';
  static const String userHomeScreenRoute = '/userhomescreen';
  static const String adminRegisterScreen = '/adminregisterscreen';
  static const String allBoardesListScreen = '/allboarderslistscreen';
  static const String allPaymentsList = '/listofallpayments';
  static const String adminBottomnavigation = '/adminbottomnavigation';
  static const String sendMessageToAll = '/sendmsgtoall';
  static const String individualMessage = '/individualmsg';
  static const String allboardersDetails = '/boarderdetailsscreen';
  static const String adminHomeScreen = '/adminhomescreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}

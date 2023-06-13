import 'package:bodima/feature/admin_screens/admin_bottom_navigation.dart';
import 'package:bodima/feature/admin_screens/admin_home.dart';
import 'package:bodima/feature/admin_screens/admin_registe.dart';
import 'package:bodima/feature/admin_notifications/send_notifications_screen.dart';
import 'package:bodima/feature/admin_screens/all_boarders.dart';
import 'package:bodima/feature/admin_screens/individual_msg.dart';
import 'package:bodima/feature/admin_screens/payment_list.dart';
import 'package:bodima/feature/admin_screens/send_msg_to_all.dart';
import 'package:bodima/feature/auth/nic_upload_screen.dart';
import 'package:bodima/feature/boarding_details_screen/boarding_details_screen.dart';
import 'package:bodima/feature/user_screens/payment_upload/payment_upload_screen.dart';
import 'package:bodima/feature/user_screens/user_bottom_navigation_bar.dart';
import 'package:bodima/feature/users_list_screen/users_list_screen.dart';
import '../app/splash_screen.dart';
import '../app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../feature/auth/otp_input_screen.dart';
import '../feature/auth/otp_phone_number_page.dart';
import '../feature/auth/user_details_form_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'My App',
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,

        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          // '/': (context) => SplashScreen(),
          '/': (context) => SplashScreen(),
          '/otpphonenumberscreen': (context) => OtpPhoneNumberScreen(),
          '/otpinputscreen': (context) => OtpInputScreen(),
          '/userdetailsformscreen': (context) => UserDetailsFormScreen(),
          '/nicuploadscreen': (context) => NicUploadScreen(),
          '/bottomnavigation': (context) => BottomNavigation(),
          '/uploadpaymentscreen': (context) => PaymentUploadScreen(),
          '/sendnotifications': (context) => SendNotificationsScreen(),
          '/boardingdetailsscreen': (context) => BoardingDetailsScreen(),
          '/userslistscreen': (context) => UsersListScreen(),
          '/adminregisterscreen': (context) => AdminRegisterScreen(),
          '/allboarderslistscreen': (context) => AllBoardersListScreen(),
          '/adminbottomnavigation': (context) => AdminBottomNavigation(),
          '/sendmsgtoall': (context) => SendMSGToAll(),
          '/individualmsg': (context) => IndividualMSGScreen(),
          '/boarderdetailsscreen': (context) => BoardingDetailsScreen(),
          '/adminhomescreen':(context) => AdminHomeScreen(),
        },

        // onGenerateRoute: (settings) {
        //   switch (settings.name) {
        //     case SplashScreen.routeName:
        //       return MaterialPageRoute(builder: (context) => SplashScreen());

        //     case AdminHomeScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const AdminHomeScreen());

        //     case SendNotificationsScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const SendNotificationsScreen());

        //     case NotificationScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const NotificationScreen());

        //     case BoardingDetailsScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const BoardingDetailsScreen());

        //     case UserDetailsFormScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const UserDetailsFormScreen());

        //     case OtpPhoneNumberScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const OtpPhoneNumberScreen());

        //     case OtpInputScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const OtpInputScreen(

        //               ));

        //     case NicUploadScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const NicUploadScreen());

        //     case PaymentHistoryScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const PaymentHistoryScreen());

        //     case UserProfileScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const UserProfileScreen());

        //     case UserMainScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const UserMainScreen());

        //     case UsersListScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const UsersListScreen());

        //     case BottomNavigation.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const BottomNavigation());

        //     case PaymentUploadScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const PaymentUploadScreen());

        //     case UserHomeScreen.routeName:
        //       return MaterialPageRoute(
        //           builder: (context) => const UserHomeScreen());

        //     default:
        //       return null;
        //   }
        // },
      ),
    );
  }
}

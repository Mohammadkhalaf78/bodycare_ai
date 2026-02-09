import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/features/auth_petiant/forgot_password.dart';
import 'package:bodycare_ai/features/auth_petiant/sign_in_pathent_screen.dart';
import 'package:bodycare_ai/features/main_navigation.dart';
import 'package:bodycare_ai/features/patients/dashbord/chat_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/dashbord_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/session_details_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/body-diagram.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/doctor_datials_page.dart';
import 'package:bodycare_ai/features/patients/doctors/doctors/doctors_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/report_details_page.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:bodycare_ai/features/users/data/models/report_model.dart';
import 'package:bodycare_ai/features/users/data/models/sessions_history.dart';
import 'package:bodycare_ai/features/welcome_and_select_role/role_screen.dart';
import 'package:bodycare_ai/features/auth_petiant/login_patient_screen.dart';
import 'package:bodycare_ai/features/welcome_and_select_role/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeScreen:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());

      case Routes.selectRoleScreen:
        return MaterialPageRoute(builder: (_) => SelectRoleScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginPatientScreen());

      case Routes.signInPatientScreen:
        return MaterialPageRoute(builder: (_) => SignUpPathientScreen());

      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassword());

      case Routes.dashBoardPage:
        return MaterialPageRoute(builder: (_) => DashBoardPage());

      case Routes.bodyDiagram:
        return MaterialPageRoute(builder: (_) => BodyDiagram());

      case Routes.mainNavigation:
        return MaterialPageRoute(builder: (_) => MainNavigation());

      case Routes.doctorsPage:
        return MaterialPageRoute(builder: (_) => DoctorsPage());

      case Routes.chatPage:
        return MaterialPageRoute(builder: (_) => ChatPage());
  
      case Routes.reportDetailsPage:
        return MaterialPageRoute(
          builder: (_) => ReportDetailsPage(reportData: ReportModel()),
        );

      case Routes.doctorDetailsPage:
        final args = settings.arguments as FormattedDoctor;
        return MaterialPageRoute(
          builder: (_) => DoctorDetailsPage(doctorIndex: args),
        );

      case Routes.sessionDetails:
        final args = settings.arguments as SessionsHistory;
        return MaterialPageRoute(
          builder: (_) => SessionDetailsPage(sessionIndex: args),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('NO route definde for ${settings.name}')),
          ),
        );
    }
  }
}

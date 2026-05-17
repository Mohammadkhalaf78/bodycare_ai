import 'package:bodycare_ai/core/routing/routes.dart';
import 'package:bodycare_ai/features/auth/forget_password/forgot_password_patient.dart';
import 'package:bodycare_ai/features/auth/login_doctor/login_doctor_page.dart';
import 'package:bodycare_ai/features/auth/sign_up_petiant/sign_in_pathent_screen.dart';
import 'package:bodycare_ai/features/auth/sign_up_doctor/registration_received_page.dart';
import 'package:bodycare_ai/features/auth/sign_up_doctor/sign_up_doctor_page.dart';
import 'package:bodycare_ai/features/doctor_profile/appointment/appointments_screen.dart';
import 'package:bodycare_ai/features/doctor_profile/appointment_details/appointment_details_screen.dart';
import 'package:bodycare_ai/features/doctor_profile/case_datails/case_datails_screen.dart';
import 'package:bodycare_ai/features/doctor_profile/home_screen/home_screen_page.dart';
import 'package:bodycare_ai/features/doctor_profile/profile/profile_screen.dart';
import 'package:bodycare_ai/features/patients/doctors/selected_time/select_time_slot_screen.dart';
import 'package:bodycare_ai/layout/main_layout_doctor.dart';
import 'package:bodycare_ai/layout/main_navigation.dart';
import 'package:bodycare_ai/features/patients/dashbord/Report%20&%20History/history.page.dart';
import 'package:bodycare_ai/features/patients/dashbord/Report%20&%20History/medical_diagram_report.dart';
import 'package:bodycare_ai/features/patients/dashbord/chat_boot/chat_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/dashbord_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/session/session_details_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/body_diagram/body-diagram.dart';
import 'package:bodycare_ai/features/patients/doctors/doctor_details/doctor_datials_page.dart';
import 'package:bodycare_ai/features/patients/doctors/doctors/doctors_page.dart';
import 'package:bodycare_ai/features/patients/dashbord/Report%20&%20History/report_details_page.dart';
import 'package:bodycare_ai/features/users/data/models/doctors_model.dart';
import 'package:bodycare_ai/features/users/data/models/sessions_history.dart';
import 'package:bodycare_ai/features/welcome_and_select_role/role_screen.dart';
import 'package:bodycare_ai/features/auth/login_petiant/login_patient_screen.dart';
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

      case Routes.loginDoctorScreen:
        return MaterialPageRoute(builder: (_) => LoginDoctorScreen());

      case Routes.signUpDoctorPage:
        return MaterialPageRoute(builder: (_) => SignUpDoctorPage());

      case Routes.registrationReceivedPage:
        return MaterialPageRoute(builder: (_) => RegistrationReceivedPage());

      case Routes.forgotPassword:
        return MaterialPageRoute(builder: (_) => ForgotPassword());

      case Routes.dashBoardPage:
        return MaterialPageRoute(builder: (_) => DashBoardPage());

      case Routes.drMainNavigation:
        return MaterialPageRoute(builder: (_) => MainLayoutDoctor());

      case Routes.appointmentsScreen:
        return MaterialPageRoute(builder: (_) => AppointmentsScreen());

      case Routes.SelectTimeSlotScreen:
        return MaterialPageRoute(builder: (_) => SelectTimeSlotScreen());

      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case Routes.caseDatailsScreen:
        return MaterialPageRoute(builder: (_) => CaseDatailsScreen());
        
      case Routes.appointmentDetailsScreen:
        return MaterialPageRoute(builder: (_) => AppointmentDetailsScreen());

      case Routes.bodyDiagram:
        return MaterialPageRoute(builder: (_) => BodyDiagram());

      case Routes.mainNavigation:
        return MaterialPageRoute(builder: (_) => MainNavigation());

      case Routes.doctorsPage:
        return MaterialPageRoute(builder: (_) => DoctorsPage());

      case Routes.chatPage:
        return MaterialPageRoute(builder: (_) => ChatPage(selectedPart: '',));

      case Routes.historyPage:
        return MaterialPageRoute(builder: (_) => HistoryPage());

      case Routes.medicalDiagramReport:
        return MaterialPageRoute(builder: (_) => MedicalDiagramReport());

  
      case Routes.reportDetailsPage:
        final args = settings.arguments; // keep dynamic to avoid incorrect cast
        return MaterialPageRoute(
          builder: (_) => ReportDetailsPage(reportData: args),
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

      // doctor routes
      case Routes.homeScreenDoctorPage:
        return MaterialPageRoute(builder: (_) => HomeScreenDoctorPage());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('NO route definde for ${settings.name}')),
          ),
        );
    }
  }
}

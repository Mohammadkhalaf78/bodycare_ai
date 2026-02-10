import 'package:bodycare_ai/core/cubit/user_cubit.dart';
import 'package:bodycare_ai/core/cubit/user_state.dart';
import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/features/patients/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsPage extends StatefulWidget {
  const DoctorsPage({super.key});

  @override
  State<DoctorsPage> createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
@override
  void initState() {
    super.initState();
    context.read<UserCubit>().getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetDoctorsFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('state.errormassege')));

          
        }
      },
      builder: (context, state) {
         context.read<UserCubit>();
        return Scaffold(
          backgroundColor: ColorsManeger.mainBlue,
          appBar: AppBar(
            title: const Text('Doctors'),
            backgroundColor: ColorsManeger.wightColor,
          ),
          body: state is GetDoctorsLoading
              ? Center(child: CircularProgressIndicator())
              : state is GetDoctorsSuccess?
               Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: state.doctors.formattedDoctors.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(
                        doctor: state.doctors.formattedDoctors[index],
                        onBook: () {
                          context.pushNamed(
                            '/DoctorDetailsPage',
                            arguments:
                                state.doctors.formattedDoctors[index],
                          );
                        },
                      );
                    },
                  ),
                )
              : Container(
                  child: Center(
                    child: Text('No doctors available'),
                  ),
              )
        );
      },
    );
  }
}

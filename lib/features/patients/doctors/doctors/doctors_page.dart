import 'package:bodycare_ai/core/helpers/extensions.dart';
import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:bodycare_ai/features/patients/doctors/doctors/cubit/doctors_cubit.dart';
import 'package:bodycare_ai/features/patients/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsPage extends StatelessWidget {
  const DoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorsCubit, DoctorsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final cubit = DoctorsCubit.get(context);
        return Scaffold(
          backgroundColor: ColorsManeger.mainBlue,
          appBar: AppBar(
            title: const Text('Doctors'),
            backgroundColor: ColorsManeger.wightColor,
          ),
          body: state is GetDoctorsLoading
              ? Center(child: CircularProgressIndicator())
              : state is GetDoctorsSuccess
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: cubit.doctorsModel!.formattedDoctors.length,
                    itemBuilder: (context, index) {
                      return DoctorCard(
                        doctor: cubit.doctorsModel!.formattedDoctors[index],
                        onBook: () {
                          context.pushNamed(
                            '/DoctorDetailsPage',
                            arguments: cubit.doctorsModel!.formattedDoctors[index],
                          );
                        },
                      );
                    },
                  ),
                )
              : state is GetDoctorsError
              ? Text('Error: ${state.error}')
              : Text('Press button to load data'),
        );
      },
    );
  }
}


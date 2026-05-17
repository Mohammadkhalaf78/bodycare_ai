import 'package:bodycare_ai/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class AppFormPhoneFiled extends StatelessWidget {
  const AppFormPhoneFiled({super.key, required this.controller, required this.validator});
  final PhoneController controller;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return PhoneFormField(
      validator: validator,
      controller: controller,
      // initialValue: PhoneNumber(
      //   isoCode: IsoCode.EG,
      //   nsn: controller,
      // ), // or use the controller
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: ColorsManeger.darkGreen,
            width: 1.3,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Enter your phone number',
      ),
      countrySelectorNavigator: const CountrySelectorNavigator.page(),
      enabled: true,
      isCountrySelectionEnabled: true,
      isCountryButtonPersistent: true,
      countryButtonStyle: const CountryButtonStyle(
        showDialCode: true,
        showIsoCode: true,
        showFlag: true,
        flagSize: 16,
      ),
    );
  }
}

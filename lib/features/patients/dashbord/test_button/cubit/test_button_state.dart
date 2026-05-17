part of 'test_button_cubit.dart';

@immutable
sealed class TestButtonState {}

final class TestButtonInitial extends TestButtonState {}

final class TestButtonLoading extends TestButtonState {}

final class TestButtonSuccess extends TestButtonState {
   final ChatbotModelRessponse response;

TestButtonSuccess({required this.response});
  // TestButtonSuccess({required this.response});
}

final class TestButtonFailure extends TestButtonState {
  final String errMessage;

  TestButtonFailure({required this.errMessage});
}


part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}
final class RegistrationLoading extends RegistrationState {}
final class RegistrationSucess extends RegistrationState {}
final class RegistrationError extends RegistrationState {
  final String errorMsg;

  RegistrationError({required this.errorMsg});
}

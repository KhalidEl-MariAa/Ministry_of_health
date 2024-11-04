part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}
final class SignInLoading extends SignInState {}
final class SignInSuceess extends SignInState {}
final class SignInError extends SignInState {
  final String errorMsg;

  SignInError({required this.errorMsg});
}

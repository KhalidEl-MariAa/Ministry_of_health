part of 'add_hala_cubit.dart';

@immutable
sealed class AddHalaState {}

final class AddHalaInitial extends AddHalaState {}
final class AddHalaLoading extends AddHalaState {}
final class AddHalaSuccess extends AddHalaState {}
final class AddHalaFailure extends AddHalaState {
  final String errorMsg;

  AddHalaFailure({required this.errorMsg});
}

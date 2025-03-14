part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}
final class GetProfileLoading extends GetProfileState {}
final class GetProfileSuccess extends GetProfileState {
  final GetProfileModel getProfileModel;
  GetProfileSuccess({required this.getProfileModel});
}
final class GetProfileError extends GetProfileState {
  final String error;
  GetProfileError({required this.error});
}

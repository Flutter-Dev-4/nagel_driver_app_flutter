part of 'move_start_cubit.dart';

@immutable
sealed class MoveStartState {}

final class MoveStartInitial extends MoveStartState {}
final class MoveStartLoading extends MoveStartState {}
final class MoveStartSuccess extends MoveStartState {
  final String message;
  MoveStartSuccess({required this.message});
}
final class MoveStartError extends MoveStartState {
  final String error;
  MoveStartError({required this.error});
}

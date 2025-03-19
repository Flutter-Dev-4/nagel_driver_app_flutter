part of 'my_orders_cubit.dart';

@immutable
sealed class MyOrdersState {}

final class MyOrdersInitial extends MyOrdersState {}
final class MyOrdersLoading extends MyOrdersState {}
final class MyOrdersSuccess extends MyOrdersState {
  final List<MyOrdersList> myOrdersList;
  MyOrdersSuccess({required this.myOrdersList});
}
final class MyOrdersError extends MyOrdersState {
  final String error;
  MyOrdersError({required this.error});
}

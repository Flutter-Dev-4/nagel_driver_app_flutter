part of 'order_history_cubit.dart';

@immutable
sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}
final class OrderHistoryLoading extends OrderHistoryState {}
final class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderHistory> orderHistory;
  OrderHistorySuccess({required this.orderHistory});
}
final class OrderHistoryError extends OrderHistoryState {
  final String error;
  OrderHistoryError({required this.error});
}

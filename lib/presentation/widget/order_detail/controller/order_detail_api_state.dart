part of 'order_detail_api_cubit.dart';

@immutable
sealed class OrderDetailApiState {}

final class OrderDetailApiInitial extends OrderDetailApiState {}
final class OrderDetailApiLoading extends OrderDetailApiState {}
final class OrderDetailApiSuccess extends OrderDetailApiState {
  final OrderDetailModel orderDetailModel;
  OrderDetailApiSuccess({required this.orderDetailModel});
}
final class OrderDetailApiError extends OrderDetailApiState {
  final String error;
  OrderDetailApiError({required this.error});
}

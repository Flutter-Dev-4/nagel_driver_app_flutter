part of 'order_detail_api_cubit.dart';

class OrderDetailApiState {
  final Position? currentPosition;
  final LatLng? current;
  final LatLng? destination;
  final Set<Polyline> polylines;
  final int currentIndex;
  final bool isLoading;

  OrderDetailApiState({
    this.currentPosition,
    this.current,
    this.destination,
    this.polylines = const {},
    this.currentIndex = 0,
    this.isLoading = true,
  });

  OrderDetailApiState copyWith({
    Position? currentPosition,
    LatLng? current,
    LatLng? destination,
    Set<Polyline>? polylines,
    int? currentIndex,
    bool? isLoading,
  }) {
    return OrderDetailApiState(
      currentPosition: currentPosition ?? this.currentPosition,
      current: current ?? this.current,
      destination: destination ?? this.destination,
      polylines: polylines ?? this.polylines,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

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

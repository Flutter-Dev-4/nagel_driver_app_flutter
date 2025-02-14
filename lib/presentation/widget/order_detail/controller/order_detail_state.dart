import 'package:driver_app/export.dart';

// Cubit State
class OrderDetailsState {
  final Position? currentPosition;
  final LatLng? current;
  final LatLng? destination;
  final Set<Polyline> polylines;
  final int currentIndex;
  final bool isLoading;

  OrderDetailsState({
    this.currentPosition,
    this.current,
    this.destination,
    this.polylines = const {},
    this.currentIndex = 0,
    this.isLoading = true,
  });

  OrderDetailsState copyWith({
    Position? currentPosition,
    LatLng? current,
    LatLng? destination,
    Set<Polyline>? polylines,
    int? currentIndex,
    bool? isLoading,
  }) {
    return OrderDetailsState(
      currentPosition: currentPosition ?? this.currentPosition,
      current: current ?? this.current,
      destination: destination ?? this.destination,
      polylines: polylines ?? this.polylines,
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

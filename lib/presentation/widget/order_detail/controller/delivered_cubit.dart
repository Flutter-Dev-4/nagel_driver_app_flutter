import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'delivered_state.dart';

class DeliveredCubit extends Cubit<DeliveredState> {
  DeliveredCubit() : super(DeliveredInitial());
}

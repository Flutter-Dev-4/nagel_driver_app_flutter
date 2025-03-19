import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'arrived_state.dart';

class ArrivedCubit extends Cubit<ArrivedState> {
  ArrivedCubit() : super(ArrivedInitial());
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'spinning_circle_state.dart';

class SpinningCircleCubit extends Cubit<SpinningCircleState> {
  SpinningCircleCubit() : super(SpinningCircleInitial());
}

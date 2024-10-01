import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_item_state.dart';

class SelectItemCubit extends Cubit<SelectItemState> {
  SelectItemCubit() : super(SelectItemInitial());
}

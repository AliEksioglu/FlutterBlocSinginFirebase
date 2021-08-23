import 'package:bloc/bloc.dart';
import 'cats_state.dart';

class CatsCubit extends Cubit<CatsState> {
  CatsCubit() : super(CatsInitial());

  Future<void> getCats() async {
    try {
      emit(CatsLoading());
      await Future.delayed(Duration(milliseconds: 500));
      final response = await Future.value(["a", "b"]);
      emit(CatsCompleted(response: response));
    } catch (e) {
      emit(CatsError(errorMessage: "Giriş sağlanamadı"));
    }
  }
}

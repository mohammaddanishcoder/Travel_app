import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialStates()) {
    emit(WelcomeStates());
  }

  final DataServices data;
  late final places;

  Future<void> getData() async {
    try {
      emit(LoadingStates());
      places = await data.getInfo();
      emit(LoadedStates(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailStates(data));
  }
  goToHomePage()
  {
    emit(LoadedStates(places));
  }

}

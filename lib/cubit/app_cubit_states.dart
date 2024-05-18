import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class CubitStates extends Equatable{}

class InitialStates extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
class WelcomeStates extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoadingStates extends CubitStates {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}


class LoadedStates extends CubitStates {
LoadedStates(this.places);
final List<DataModel> places;
  @override
  // TODO: implement props
  List<Object> get props => [places];
}
class DetailStates extends CubitStates {
  DetailStates(this.place);
  final DataModel place;
  @override
  // TODO: implement props
  List<Object> get props => [place];
}
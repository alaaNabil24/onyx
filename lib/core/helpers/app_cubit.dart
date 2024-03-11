import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());



  String lang = "en";

  Future<void> appInit() async {

  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valyuta_kurs/core/api/currency_api.dart';
import 'package:valyuta_kurs/pages/block/main_event.dart';
import 'package:valyuta_kurs/pages/block/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CurrencyApi _api;

  MainBloc(this._api) :super(MainState()) {
    on<MainGetLastEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try{
emit(state.copyWith(
  status:Status.success,
  currencies:await _api.currencies(),
));
      }catch (e){
        emit(state.copyWith(status: Status.fail,message: "$e"));
      }
    });

    on<MainGetDateEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        emit(state.copyWith(
          status: Status.success,
          currencies: await _api.currencies(date: event.date),
        ));
      } catch (e) {
        emit(state.copyWith(status: Status.fail, message: "$e"));
      }
    });
    on<MainGetLanguage>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
      try {
        emit(state.copyWith(
          status: Status.success,
        ));
      } catch (e) {
        emit(state.copyWith(status: Status.fail, message: "$e"));
      }
    });
  }

}
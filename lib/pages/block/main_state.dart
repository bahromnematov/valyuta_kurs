import 'package:flutter/cupertino.dart';

import '../../core/model/curency_model.dart';

@immutable
class MainState {
  final Status status;
  final List<CurrencyModel> currencies;
  final String message;

  const MainState(
      {this.status = Status.initial,
      this.message = "",
      this.currencies = const []});

  MainState copyWith({
    Status? status,
    List<CurrencyModel>? currencies,
    String? message,
  }) {
    return MainState(
      status: status ?? this.status,
      currencies: currencies ?? this.currencies,
      message: message ?? this.message,
    );
  }
}

enum Status { initial, fail, loading, success }

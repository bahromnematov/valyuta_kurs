import 'package:valyuta_kurs/core/api/api_base.dart';

import '../model/curency_model.dart';

class CurrencyApi {
  final ApiBase _base;

  CurrencyApi(this._base);

  Future<List<CurrencyModel>> currencies({
    DateTime? date,
  }) async {
    var url = "/uz/arkhiv-kursov-valyut/json/";
    if (date != null) {
      url = "${url}all/${date.year}-${date.month}-${date.day}/";
    }

    final respone = await _base.dio.get(url);
    return (respone.data as List)
        .map((e) => CurrencyModel.fromJson(e))
        .toList();
  }
}

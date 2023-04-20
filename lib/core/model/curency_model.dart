import 'package:flutter/material.dart';


class CurrencyModel {
  CurrencyModel._({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNm,
    required this.ccyNmRu,
    required this.ccyNmUz,
    required this.ccyNmUzc,
    required this.ccyNmEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });

  final int id;
  final String code;
  final String ccy;
  final String ccyNm;
  final String ccyNmRu;
  final String ccyNmUz;
  final String ccyNmUzc;
  final String ccyNmEn;
  final String nominal;
  final String rate;
  final String diff;
  final String date;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel._(
    id: json["id"] ?? 0,
    code: json["Code"] ?? "",
    ccy: json["Ccy"] ?? "",
    ccyNm: "",
    ccyNmRu: json["CcyNm_RU"] ?? "",
    ccyNmUz: json["CcyNm_UZ"] ?? "",
    ccyNmUzc: json["CcyNm_UZC"] ?? "",
    ccyNmEn: json["CcyNm_EN"] ?? "",
    nominal: json["Nominal"] ?? "",
    rate: json["Rate"] ?? "",
    diff: json["Diff"] ?? "",
    date: json["Date"] ?? "",
  );

  CurrencyModel tr(Locale locale) {
    var ccyNm = ccyNmUz;
    switch (locale.countryCode) {
      case "RU":
        ccyNm = ccyNmRu;
        break;
      case "EN":
        ccyNm = ccyNmEn;
        break;
      case "UZC":
        ccyNm = ccyNmUzc;
        break;
      default:
        ccyNm = ccyNmUz;
        break;
    }
    return CurrencyModel._(
      id: id,
      code: code,
      ccy: ccy,
      ccyNm: ccyNm,
      ccyNmRu: ccyNmRu,
      ccyNmUz: ccyNmUz,
      ccyNmUzc: ccyNmUzc,
      ccyNmEn: ccyNmEn,
      nominal: nominal,
      rate: rate,
      diff: diff,
      date: date,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "Code": code,
    "Ccy": ccy,
    "CcyNm_RU": ccyNmRu,
    "CcyNm_UZ": ccyNmUz,
    "CcyNm_UZC": ccyNmUzc,
    "CcyNm_EN": ccyNmEn,
    "Nominal": nominal,
    "Rate": rate,
    "Diff": diff,
    "Date": date,
  };
}

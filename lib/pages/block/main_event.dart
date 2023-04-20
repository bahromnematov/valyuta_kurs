import 'package:flutter/cupertino.dart';

@immutable
abstract class MainEvent {}

class MainGetLastEvent extends MainEvent {}

class MainGetDateEvent extends MainEvent {
  final DateTime date;

  MainGetDateEvent(this.date);
}
class MainGetLanguage extends MainEvent{}

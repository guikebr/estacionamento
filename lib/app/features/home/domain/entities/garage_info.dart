import 'car_info.dart';

abstract class GarageInfo {
  int get id;

  CarInfo? get car;

  DateTime? get entrance;

  DateTime? get exit;

  double? get total;
}

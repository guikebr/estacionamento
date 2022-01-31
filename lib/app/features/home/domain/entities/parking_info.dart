import 'garage_info.dart';

abstract class ParkingInfo {
  int get countAvailable;

  List<GarageInfo> get garages;
}

import 'package:estacionamento/app/features/home/domain/entities/garage_info.dart';
import 'package:estacionamento/app/features/home/infra/models/garage_model.dart';
import 'package:estacionamento/app/features/home/infra/models/parking_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('[] operator', () {
    group('when index value is valid', () {
      test('should return specified todo', () {
        final List<GarageInfo> garages = _buildGarages(4);
        final ParkingModel actual = ParkingModel(garages.length, garages);
        final int expected = actual.countAvailable;
        expect(expected, garages.length);
      });
    });

    group('when index value is invalid', () {
      test('should throw exception', () {
        final List<GarageInfo> garages = _buildGarages(4);
        final ParkingModel actual = ParkingModel(garages.length, garages);
        final List<GarageInfo> expected = actual.garages;
        expect(() => expected[5], throwsRangeError);
      });
    });
  });

  group('length getter', () {
    group('when todo list is empty', () {
      test('should return 0', () {
        final List<GarageInfo> garages = _buildGarages(0);
        final int actual = garages.length;
        expect(actual, 0);
      });
    });

    group('when todo list is not empty', () {
      test('should return 2', () {
        final int actual = _buildGarages(2).length;
        expect(actual, 2);
      });
    });
  });
}

List<GarageInfo> _buildGarages(final int countAvailable) {
  return List<GarageInfo>.generate(
    countAvailable,
    (int index) => GarageModel(id: index),
  );
}

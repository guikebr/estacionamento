import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import 'app/features/app_widget.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  GetStorage.init().whenComplete(
    () => SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).whenComplete(() => runApp(const AppWidget())),
  );
}

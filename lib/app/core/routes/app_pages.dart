import 'package:get/get.dart';

import '../../features/add/presentation/pages/finalize/finalize_binding.dart';
import '../../features/add/presentation/pages/finalize/finalize_page.dart';
import '../../features/add/presentation/pages/start/start_binding.dart';
import '../../features/add/presentation/pages/start/start_page.dart';
import '../../features/home/presentation/pages/available/available_binding.dart';
import '../../features/home/presentation/pages/available/available_page.dart';
import '../../features/home/presentation/pages/historic/historic_binding.dart';
import '../../features/home/presentation/pages/historic/historic_page.dart';
import '../../features/home/presentation/pages/home/home_binding.dart';
import '../../features/home/presentation/pages/home/home_page.dart';
import '../../features/home/presentation/pages/occupied/occupied_binding.dart';
import '../../features/home/presentation/pages/occupied/occupied_page.dart';
import '../../features/settings/presentation/pages/setting/setting_binding.dart';
import '../../features/settings/presentation/pages/setting/setting_page.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static String get initial => Routes.homePage;

  static List<GetPage<dynamic>> get routes => <GetPage<dynamic>>[
        GetPage<HomePage>(
          name: Routes.homePage,
          page: () => const HomePage(),
          bindings: <Bindings>[
            HomeBinding(),
            AvailableBinding(),
            OccupiedBinding(),
            HistoricBinding(),
          ],
        ),
        GetPage<AvailablePage>(
          name: Routes.garagesPage,
          page: () => const AvailablePage(),
        ),
        GetPage<OccupiedPage>(
          name: Routes.occupiedPage,
          page: () => const OccupiedPage(),
        ),
        GetPage<HistoricPage>(
          name: Routes.historicPage,
          page: () => const HistoricPage(),
          binding: HistoricBinding(),
        ),
        GetPage<SettingPage>(
          name: Routes.settingsPage,
          page: () => const SettingPage(),
          binding: SettingBinding(),
        ),
        GetPage<StartPage>(
          name: Routes.startPage,
          page: () => const StartPage(),
          binding: StartBinding(),
        ),
        GetPage<FinalizePage>(
          name: Routes.finalizePage,
          page: () => const FinalizePage(),
          binding: FinalizeBinding(),
        ),
      ];
}

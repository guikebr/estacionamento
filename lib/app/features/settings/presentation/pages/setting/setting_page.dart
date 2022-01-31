import 'package:estacionamento/app/core/widget/input/input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/keys_translation.dart';
import 'setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              leading: CupertinoNavigationBarBackButton(
                previousPageTitle: KeysTranslation.buttonBack.tr,
                color: Theme.of(context).colorScheme.onBackground,
                onPressed: () => Get.close(1),
              ),
              largeTitle: Text(
                KeysTranslation.buttonSettings.tr,
                style: controller.typography.title2.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                title: Text(
                  KeysTranslation.textTheme.tr,
                  style: controller.typography.title3.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GetBuilder<SettingController>(
                builder: (SettingController get) => Padding(
                  padding: EdgeInsets.only(
                    right: get.spacing.xxsmall,
                    bottom: get.spacing.xxsmall,
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runSpacing: get.spacing.xsmall,
                    children: get.themes
                        .map(
                          (ThemeMode e) => GestureDetector(
                            onTap: () => get.changeTheme(e.index),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              margin: EdgeInsets.symmetric(
                                horizontal: get.spacing.xxsmall,
                              ),
                              decoration: BoxDecoration(
                                color: e.index == get.currentTheme
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(get.shape.small),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(get.spacing.xxsmall),
                                child: Text(
                                  e.name.toUpperCase(),
                                  style: get.typography.title4.copyWith(
                                    leadingDistribution:
                                        TextLeadingDistribution.even,
                                    color: e.index == get.currentTheme
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onBackground,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: Divider()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(controller.spacing.xsmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      '${KeysTranslation.textHourValue.tr}:',
                      style: controller.typography.title3,
                    ),
                    Input(
                      placeholder: KeysTranslation.textHourValue.tr,
                      controller: controller.valueController,
                      keyboardType: TextInputType.number,
                      onChanged: controller.changeValueHour,
                      clearButtonMode: OverlayVisibilityMode.never,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

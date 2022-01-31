import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/languages.dart';
import '../../../../../core/widget/button/button.dart';
import 'finalize_controller.dart';

class FinalizePage extends GetView<FinalizeController> {
  const FinalizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: Column(
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: <Widget>[
                  CupertinoSliverNavigationBar(
                    leading: CupertinoNavigationBarBackButton(
                      previousPageTitle: KeysTranslation.buttonBack.tr,
                      color: Theme.of(context).colorScheme.onBackground,
                      onPressed: () => Get.close(1),
                    ),
                    largeTitle: Text(
                      KeysTranslation.titleRegister.tr,
                      style: controller.typography.title2.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  SliverFillRemaining(
                    child: Padding(
                      padding: EdgeInsets.all(controller.spacing.xxsmall),
                      child: CustomScrollView(
                        slivers: <Widget>[
                          CupertinoSliverRefreshControl(
                            onRefresh: () async => controller.update(),
                          ),
                          ListTile(
                            title: Text(
                              '${KeysTranslation.textDate.tr}:',
                              style: controller.typography.title3,
                            ),
                            subtitle: Text(
                              controller.day,
                              style: controller.typography.title3,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              KeysTranslation.textHour.tr,
                              style: controller.typography.title3,
                            ),
                            subtitle: Text(
                              controller.hours,
                              style: controller.typography.title3,
                            ),
                          ),
                          const Divider(),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: ListTile(
                                  title: Text(
                                    'Tempo',
                                    style: controller.typography.title3,
                                  ),
                                  subtitle: Text(
                                    controller.hoursToPay,
                                    style: controller.typography.title3,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text(
                                    'Total a pagar',
                                    style: controller.typography.title3,
                                  ),
                                  subtitle: Text(
                                    controller.totalToPay,
                                    style: controller.typography.title3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              '${KeysTranslation.textName.tr}:',
                              style: controller.typography.title3,
                            ),
                            subtitle: Text(
                              controller.car.name,
                              style: controller.typography.title3,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              '${KeysTranslation.textPlate.tr}:',
                              style: controller.typography.title3,
                            ),
                            subtitle: Text(
                              controller.car.plate,
                              style: controller.typography.title3,
                            ),
                          ),
                          const Divider(),
                          ListTile(
                            title: Text(
                              '${KeysTranslation.textContact.tr}:',
                              style: controller.typography.title3,
                            ),
                            subtitle: Text(
                              controller.car.contact,
                              style: controller.typography.title3,
                            ),
                          ),
                          const Divider(),
                        ]
                            .map((Widget e) =>
                                e is CupertinoSliverRefreshControl
                                    ? e
                                    : SliverToBoxAdapter(child: e))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(controller.spacing.xxsmall),
              child: GetBuilder<FinalizeController>(
                builder: (FinalizeController get) {
                  return Button(
                    label: KeysTranslation.buttonFinalize.tr,
                    variant: get.enableFinalize
                        ? ButtonVariant.danger
                        : ButtonVariant.disabled,
                    hasShape: true,
                    alignTextCenter: true,
                    onPressed: get.finalize,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

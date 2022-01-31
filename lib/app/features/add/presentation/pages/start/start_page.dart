import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/keys_translation.dart';
import '../../../../../core/widget/button/button.dart';
import '../../../../../core/widget/input/input.dart';
import 'start_controller.dart';

class StartPage extends GetView<StartController> {
  const StartPage({Key? key}) : super(key: key);

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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(controller.spacing.xxsmall),
                        child: Column(
                          children: <Widget>[
                            Input(
                              placeholder: KeysTranslation.textPlate.tr,
                              controller: controller.maskPlate,
                            ),
                            const Divider(),
                            Input(
                              controller: controller.name,
                              placeholder: KeysTranslation.textName.tr,
                            ),
                            const Divider(),
                            Input(
                              placeholder: KeysTranslation.textContact.tr,
                              controller: controller.maskContact,
                              keyboardType: TextInputType.number,
                            ),
                            const Divider(),
                            ListTile(
                              title: Text(
                                '${KeysTranslation.textDate.tr}:',
                                style: controller.typography.title3,
                              ),
                              subtitle: Text(
                                controller.timestampDay,
                                style: controller.typography.title3,
                              ),
                            ),
                            ListTile(
                              title: Text(
                                KeysTranslation.textHour.tr,
                                style: controller.typography.title3,
                              ),
                              subtitle: Text(
                                '${KeysTranslation.textEntrance.tr}:'
                                ' ${controller.timestampHours}',
                                style: controller.typography.title3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(controller.spacing.xxsmall),
              child: GetBuilder<StartController>(
                builder: (StartController get) {
                  return Button(
                    label: KeysTranslation.buttonStart.tr,
                    variant: get.enableStart
                        ? ButtonVariant.secondary
                        : ButtonVariant.disabled,
                    hasShape: true,
                    alignTextCenter: true,
                    onPressed: get.start,
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

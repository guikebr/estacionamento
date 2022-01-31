import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/keys_translation.dart';
import 'home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: GetBuilder<HomeController>(
          init: controller,
          builder: (HomeController get) {
            return CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  trailing: Material(
                    type: MaterialType.transparency,
                    child: IconButton(
                      splashRadius: 20,
                      onPressed: get.navigateToSettings,
                      icon: const Icon(CupertinoIcons.settings),
                    ),
                  ),
                  largeTitle: Text(
                    KeysTranslation.textAppName.tr,
                    style: get.typography.title2.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CupertinoSlidingSegmentedControl<int>(
                    padding: EdgeInsets.all(get.spacing.xsmall),
                    thumbColor: get.getBackgroundColor(),
                    onValueChanged: get.getChangedPage,
                    groupValue: get.currentPage,
                    children: get.menu,
                  ),
                ),
                SliverFillRemaining(
                  child: PageView(
                    controller: get.pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: get.getChangedPage,
                    children: get.getPages,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

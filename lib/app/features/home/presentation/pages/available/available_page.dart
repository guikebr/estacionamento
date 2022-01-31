import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/keys_translation.dart';
import '../../../domain/entities/garage_info.dart';
import 'available_controller.dart';

class AvailablePage extends GetView<AvailableController> {
  const AvailablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: GetBuilder<AvailableController>(
          init: controller,
          builder: (AvailableController get) {
            return get.isEmptyList
                ? Center(
                    child: Text(
                      KeysTranslation.textEmptyAvailable.tr,
                      style: get.typography.title3.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  )
                : CustomScrollView(
                    slivers: <Widget>[
                      CupertinoSliverRefreshControl(
                        onRefresh: () async => get.update(),
                      ),
                      SliverToBoxAdapter(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: get.spacing.xxsmall,
                          ),
                          crossAxisCount: 2,
                          children: get.garages
                              .map(
                                (GarageInfo index) => Card(
                                  elevation: 10,
                                  child: InkWell(
                                    onTap: () => get.navigate(index),
                                    child: ListTile(
                                      title: Center(
                                        child: Text(
                                          (index.id).toString(),
                                          style: get.typography.title1.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onBackground,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
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

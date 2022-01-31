import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/languages/keys_translation.dart';
import '../../../domain/entities/garage_info.dart';
import 'occupied_controller.dart';

class OccupiedPage extends GetView<OccupiedController> {
  const OccupiedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: GetBuilder<OccupiedController>(
          init: controller,
          builder: (OccupiedController get) {
            return get.isEmpty
                ? Center(
                    child: Text(
                      KeysTranslation.textEmptyOccupied.tr,
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
                                    child: Center(
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

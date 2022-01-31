import '../../../../../core/languages/keys_translation.dart';
import '../../../domain/entities/garage_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'historic_controller.dart';

class HistoricPage extends GetWidget<HistoricController> {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: GetBuilder<HistoricController>(
          init: controller,
          builder: (HistoricController get) {
            return Column(
              children: <Widget>[
                Expanded(
                  child: get.isEmptyList
                      ? Center(
                          child: Text(
                            KeysTranslation.textEmptyHistoric.tr,
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
                              child: ListView(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: get.spacing.xxsmall,
                                ),
                                reverse: true,
                                children: get.historic
                                    .map(
                                      (GarageInfo index) => Card(
                                        elevation: 2,
                                        child: ListTile(
                                          title: Text(
                                            '${(index.id).toString()} - '
                                            '${index.car?.plate}',
                                            style:
                                                get.typography.title3.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                          ),
                                          subtitle: Text(
                                            '${get.day(index)} '
                                            '${get.hours(index)}'
                                            '${get.receiveToValue(index)}',
                                            style:
                                                get.typography.title4.copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                ),
                const Divider(),
                ListTile(
                  title: Text('Total Recebido', style: get.typography.title3),
                  trailing: Text(
                    get.totalReceived,
                    style: get.typography.title3.copyWith(
                        color: Theme.of(context).colorScheme.primaryVariant,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

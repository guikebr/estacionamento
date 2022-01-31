import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../typography/typography.dart' as typo;

class DisabledButton extends StatelessWidget {
  const DisabledButton({
    required this.label,
    required this.style,
    required this.alignTextCenter,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final ButtonStyle style;
  final bool alignTextCenter;

  typo.Typography get typography => const typo.Typography();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle disabledStyle = style.copyWith(
      foregroundColor: MaterialStateProperty.all<Color?>(
        Theme.of(context).colorScheme.background,
      ),
      backgroundColor: MaterialStateProperty.all(
        Theme.of(context).colorScheme.surface,
      ),
    );

    return SizedBox(
      width: double.maxFinite,
      height: Get.size.height * .07,
      child: TextButton(
        style: disabledStyle,
        onPressed: null,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                textAlign: alignTextCenter ? TextAlign.center : TextAlign.start,
                style: typography.button,
              ),
            ),
            if (icon != null) ...<Icon>[
              Icon(icon, color: Theme.of(context).colorScheme.background)
            ],
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(DiagnosticsProperty<IconData?>('icon', icon))
      ..add(DiagnosticsProperty<ButtonStyle>('style', style))
      ..add(DiagnosticsProperty<typo.Typography>('typography', typography))
      ..add(
        DiagnosticsProperty<bool>('alignTextCenter', alignTextCenter),
      );
  }
}

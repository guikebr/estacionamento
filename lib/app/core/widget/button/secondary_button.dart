import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../typography/typography.dart' as typo;

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.label,
    required this.onPressed,
    required this.style,
    required this.alignTextCenter,
    this.icon,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final ButtonStyle style;
  final bool alignTextCenter;
  final VoidCallback? onPressed;

  typo.Typography get typography => const typo.Typography();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle primaryStyle = style.copyWith(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (Set<MaterialState> states) => states.contains(MaterialState.pressed)
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.primaryVariant,
      ),
    );

    return SizedBox(
      height: Get.size.height * .07,
      child: TextButton(
        style: primaryStyle,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                label,
                textAlign: alignTextCenter ? TextAlign.center : TextAlign.start,
                style: typography.button.copyWith(
                  color: Theme.of(context).backgroundColor,
                ),
              ),
            ),
            if (icon != null) ...<Icon>[
              Icon(icon, color: Theme.of(context).colorScheme.primaryVariant)
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
      ..add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed))
      ..add(DiagnosticsProperty<bool>('alignTextCenter', alignTextCenter))
      ..add(
        DiagnosticsProperty<typo.Typography>('typography', typography),
      );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../spacing/shape.dart';
import '../../spacing/spacing.dart';
import 'danger_button.dart';
import 'disabled_button.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

enum ButtonVariant {
  disabled,
  primary,
  secondary,
  danger,
}

class Button extends StatelessWidget {
  const Button({
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.hasShape = false,
    this.alignTextCenter = false,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final ButtonVariant variant;
  final VoidCallback? onPressed;
  final bool hasShape;
  final bool alignTextCenter;

  Spacing get spacing => const Spacing();

  Shape get shape => const Shape();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ButtonStyle(
      elevation: MaterialStateProperty.all<double>(0),
      splashFactory: NoSplash.splashFactory,
      padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.all(spacing.xxsmall),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        hasShape
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(shape.small),
              )
            : const RoundedRectangleBorder(),
      ),
      animationDuration: const Duration(milliseconds: 250),
    );

    switch (variant) {
      case ButtonVariant.primary:
        return PrimaryButton(
          icon: icon,
          style: style,
          label: label,
          onPressed: onPressed,
          alignTextCenter: alignTextCenter,
        );
      case ButtonVariant.disabled:
        return DisabledButton(
          icon: icon,
          label: label,
          style: style,
          alignTextCenter: alignTextCenter,
        );
      case ButtonVariant.secondary:
        return SecondaryButton(
          icon: icon,
          style: style,
          label: label,
          onPressed: onPressed,
          alignTextCenter: alignTextCenter,
        );
      case ButtonVariant.danger:
        return DangerButton(
          icon: icon,
          style: style,
          label: label,
          onPressed: onPressed,
          alignTextCenter: alignTextCenter,
        );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('label', label))
      ..add(ObjectFlagProperty<VoidCallback>.has('onPressed', onPressed))
      ..add(EnumProperty<ButtonVariant>('variant', variant))
      ..add(DiagnosticsProperty<IconData?>('icon', icon))
      ..add(DiagnosticsProperty<Spacing>('spacing', spacing))
      ..add(DiagnosticsProperty<Shape>('shape', shape))
      ..add(DiagnosticsProperty<bool>('hasShape', hasShape))
      ..add(DiagnosticsProperty<bool>('alignTextCenter', alignTextCenter));
  }
}

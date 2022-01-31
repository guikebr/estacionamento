import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../spacing/shape.dart';
import '../../spacing/spacing.dart';
import '../../typography/typography.dart' as typo;

class Input extends StatefulWidget {
  const Input({
    Key? key,
    this.controller,
    this.placeholder = '',
    this.keyboardType,
    this.onChanged,
    this.prefix,
    this.enabled = false,
    this.obscureText = false,
    this.autofocus = false,
    this.padding = EdgeInsets.zero,
    this.clearButtonMode = OverlayVisibilityMode.editing,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool autofocus;
  final bool enabled;
  final bool obscureText;
  final String? placeholder;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final IconData? prefix;
  final TextInputAction textInputAction;
  final OverlayVisibilityMode clearButtonMode;
  final EdgeInsets padding;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('placeholder', placeholder))
      ..add(DiagnosticsProperty<bool>('enabled', enabled))
      ..add(DiagnosticsProperty<IconData?>('prefix', prefix))
      ..add(DiagnosticsProperty<bool>('autofocus', autofocus))
      ..add(DiagnosticsProperty<EdgeInsets>('padding', padding))
      ..add(DiagnosticsProperty<bool>('obscureText', obscureText))
      ..add(EnumProperty<TextInputAction>('textInputAction', textInputAction))
      ..add(DiagnosticsProperty<TextInputType?>('keyboardType', keyboardType))
      ..add(
        ObjectFlagProperty<Function(String p1)>.has('onChanged', onChanged),
      )
      ..add(
        EnumProperty<OverlayVisibilityMode>('clearButtonMode', clearButtonMode),
      )
      ..add(
        DiagnosticsProperty<TextEditingController?>('controller', controller),
      );
  }

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  Color? iconColor;

  typo.Typography get typography => const typo.Typography();

  Spacing get spacing => const Spacing();

  Shape get shape => const Shape();

  @override
  Widget build(BuildContext context) {
    iconColor ??= Theme.of(context).colorScheme.onPrimary;

    return Padding(
      padding: widget.padding,
      child: CupertinoTextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        autofocus: widget.autofocus,
        textInputAction: widget.textInputAction,
        onChanged: (String value) {
          setState(
            () => iconColor = value.isEmpty
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.secondaryVariant,
          );
          widget.onChanged?.call(value);
        },
        prefix: widget.prefix != null
            ? Padding(
                padding: EdgeInsets.only(left: spacing.hsmall),
                child: Icon(widget.prefix, color: iconColor),
              )
            : null,
        padding: EdgeInsets.symmetric(
          horizontal: spacing.xxsmall,
          vertical: spacing.hsmall,
        ),
        cursorColor: Theme.of(context).colorScheme.secondaryVariant,
        cursorWidth: 1,
        clearButtonMode: widget.clearButtonMode,
        keyboardType: widget.keyboardType,
        readOnly: widget.enabled,
        textCapitalization: TextCapitalization.characters,
        placeholderStyle: widget.enabled
            ? typography.title3.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold,
              )
            : typography.title3.copyWith(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(.6),
                fontWeight: FontWeight.bold,
              ),
        style: typography.title3.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(shape.small)),
          border: Border.all(color: Theme.of(context).colorScheme.background),
        ),
        placeholder: (widget.placeholder ?? '').toUpperCase(),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ColorProperty('iconColor', iconColor))
      ..add(DiagnosticsProperty<Shape>('shape', shape))
      ..add(DiagnosticsProperty<Spacing>('spacing', spacing))
      ..add(DiagnosticsProperty<typo.Typography>('typography', typography));
  }
}

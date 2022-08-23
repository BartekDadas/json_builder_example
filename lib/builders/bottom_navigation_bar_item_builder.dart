import 'dart:ui';

import 'package:child_builder/src/child_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_class/json_class.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

class JsonBottomNavigationBarItemBuilder extends JsonWidgetBuilder{

  JsonBottomNavigationBarItemBuilder({
    JsonWidgetData? activeIcon,
    this.backgroundColor,
    required this.icon,
    this.label,
    this.tooltip}) : activeIcon = activeIcon ?? icon, super(
      numSupportedChildren: kNumSupportedChildren,
      preferredSizeWidget: true);

  static const kNumSupportedChildren = 0;
  static const type = 'bottom_navigation_bar_item';

  final JsonWidgetData? activeIcon;
  final Color? backgroundColor;
  final JsonWidgetData icon;
  final String? label;
  final String? tooltip;

  static JsonBottomNavigationBarItemBuilder? fromDynamic(
    dynamic map, {
      JsonWidgetRegistry? registry
    }) {
    JsonBottomNavigationBarItemBuilder? result;
    
    if (map != null) {
      result = JsonBottomNavigationBarItemBuilder(
        icon: JsonWidgetData.fromDynamic(map['icon'])!,
        backgroundColor: ThemeDecoder.decodeColor(
            map['backgroundColor'],
            validate: false
        ) ?? Colors.white,
        activeIcon: JsonWidgetData.fromDynamic(map['icon']),
        label: map['label'],
        tooltip: map['tooltip']
      );
    }
    return result;
  }


  @override
  Widget buildCustom({ChildWidgetBuilder? childBuilder, required BuildContext context, required JsonWidgetData data, Key? key}) {
    assert (data.children?.isNotEmpty != true, '[JsonBottomNavigationBarItemBuilder] does not support children');
    return BottomNavigationBarItem(
      icon: icon.build(
          childBuilder: childBuilder,
          context: context
      ),
      backgroundColor: backgroundColor,
      activeIcon: activeIcon?.build(
          childBuilder: childBuilder,
          context: context
      ),
      label: label,
      tooltip: tooltip
    ) as Container;
  }





}
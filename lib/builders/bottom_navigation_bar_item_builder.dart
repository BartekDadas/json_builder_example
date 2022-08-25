import 'dart:ui';

import 'package:child_builder/src/child_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_class/json_class.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:json_dynamic_widget/src/schema/schema_validator.dart';
class JsonBottomNavigationBarItemBuilder {

  JsonBottomNavigationBarItemBuilder({
    JsonWidgetData? activeIcon,
    this.backgroundColor,
    required this.icon,
    this.label,
    this.tooltip}) : activeIcon = activeIcon ?? icon;

  // static const kNumSupportedChildren = 0;
  static const type = 'bottom_navigation_bar_item';

  late final JsonWidgetData? activeIcon;
  late final Color? backgroundColor;
  late final JsonWidgetData icon;
  late final String? label;
  late final String? tooltip;

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

  static List<BottomNavigationBarItem> fromDynamic2(
    dynamic items, ChildWidgetBuilder? childWidgetBuilder, BuildContext context) {
    List <BottomNavigationBarItem> results = [];
    if(items != null) {
      BottomNavigationBarItem result;
      JsonClass.fromDynamicList(items,(map) => {
        print(items),
        result = buildBottomItem(map["bottomNavigationBarItem"], childWidgetBuilder, context),
        results.add(result)
      });
    }
    return results;
  }

  static BottomNavigationBarItem buildBottomItem(map, ChildWidgetBuilder? childWidgetBuilder, BuildContext context, {
  JsonWidgetRegistry? registry}) {
    map = map["args"];
    print(map.toString());
    BottomNavigationBarItem result;
    if(map != null) {
      result = BottomNavigationBarItem(
          icon: JsonWidgetData.fromDynamic(map['icon'])!.build(childBuilder: childWidgetBuilder,context: context),
          backgroundColor: ThemeDecoder.decodeColor(['backgroundColor'], validate: false) ?? Colors.white,
          activeIcon: JsonWidgetData.fromDynamic(map['icon'])?.build(childBuilder: childWidgetBuilder ,context: context),
          label: map['label'],
          tooltip: map['tooltip']);
    } else {
      result = const BottomNavigationBarItem( label: "Error", icon: Icon(Icons.error));
    }
    return result;
  }



  // BottomNavigationBarItem returnBNI() {
  //   return BottomNavigationBarItem(
  //       label: label,
  //       icon: icon,
  //       activeIcon: activeIcon,
  //       backgroundColor: backgroundColor,
  //       tooltip: tooltip
  //   )
  // }
}
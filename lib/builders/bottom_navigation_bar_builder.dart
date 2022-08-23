
import 'package:child_builder/src/child_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:json_class/json_class.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';


import 'bottom_navigation_bar_item_builder.dart';

class JsonBottomNavigationBarBuilder extends JsonWidgetBuilder {

  final Color? backgroundColor;
  final int currentIndex;
  final double? elevation;
  final bool? enableFeedback;
  final Color? fixedColor;
  final double iconSize;
  final List<JsonBottomNavigationBarItemBuilder> items;
  final BottomNavigationBarLandscapeLayout? landscapeLayout;
  final MouseCursor? mouseCursor;
  final ValueChanged<int>? onTap;
  final double selectedFontSize;
  final IconThemeData? selectedIconTheme;
  final Color? selectedItemColor;
  final TextStyle? selectedLabelStyle;
  final bool? showSelectedLabels;
  final bool? showUnselectedLabels;
  final BottomNavigationBarType? type;
  final double unselectedFontSize;
  final IconThemeData? unselectedIconTheme;
  final Color? unselectedItemColor;
  final TextStyle? unselectedLabelStyle;

  JsonBottomNavigationBarBuilder( {
      this.backgroundColor,
      required this.currentIndex,
      this.elevation,
      this.enableFeedback,
      Color? fixedColor,
      required this.iconSize,
      required this.items,
      this.landscapeLayout,
      this.mouseCursor,
      this.onTap,
      required this.selectedFontSize,
      this.selectedIconTheme,
      Color? selectedItemColor,
      this.selectedLabelStyle,
      this.showSelectedLabels,
      this.showUnselectedLabels,
      this.type,
      required this.unselectedFontSize,
      this.unselectedIconTheme,
      this.unselectedItemColor,
      this.unselectedLabelStyle
  }) : assert(items.length >= 2),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(elevation == null || elevation >= 0.0),
        assert(iconSize >= 0.0),
        assert(
        selectedItemColor == null || fixedColor == null,
        'Either selectedItemColor or fixedColor can be specified, but not both',
        ),
        assert(selectedFontSize >= 0.0),
        assert(unselectedFontSize >= 0.0),
        selectedItemColor = selectedItemColor ?? fixedColor,
        fixedColor = selectedItemColor,
        super(
        numSupportedChildren : kNumSupportedChildren,
        preferredSizeWidget : true
        );

  static const kNumSupportedChildren = 0;
  static const kType = 'bottom_navigation_bar';

  static JsonBottomNavigationBarBuilder? fromDynamic(
      dynamic map,{
        JsonWidgetRegistry? registry
      }) {
    JsonBottomNavigationBarBuilder? result;

    if(map != null) {
      result = JsonBottomNavigationBarBuilder(
        items: JsonClass.fromDynamicList(
          map['items'],
            (map) => JsonBottomNavigationBarItemBuilder.fromDynamic(
              map['bottomNavigationBarItem'],
              registry : registry,
            )!,
        )!,
        backgroundColor: ThemeDecoder.decodeColor(
          map['backgroundColor'],
          validate: false
        ),
        currentIndex: JsonClass.parseInt(map['currentIndex']) ?? 0,
        elevation: JsonClass.parseDouble(map['elevation'], 8.0),
        enableFeedback: map['enableFeedback'] == null ? true : JsonClass.parseBool(map['enableFeedback']),
        fixedColor: ThemeDecoder.decodeColor(
            map['fixedColor'],
            validate: false
        ),
        iconSize: JsonClass.parseDouble(map['iconSize'], 16.0)!,
        landscapeLayout: ThemeDecoder.decodeBottomNavigationBarLandscapeLayout(map['landscapeLayout']),
        mouseCursor: ThemeDecoder.decodeMouseCursor(map['mouseCursor'], validate: true),
        onTap: map['onTap'],
        selectedFontSize: JsonClass.parseDouble(map['selectedFontSize'], 13.0)!,
        selectedIconTheme: ThemeDecoder.decodeIconThemeData(map['selectedIconTheme'], validate: false),
        selectedItemColor: ThemeDecoder.decodeColor(
            map['selectedItemColor'],
            validate: false
        ),
        selectedLabelStyle: ThemeDecoder.decodeTextStyle(map['selectedLabelStyle']) ,
        showSelectedLabels: map['showSelectedLabels'] == null ? true : JsonClass.parseBool(map['showSelectedLabels']),
        showUnselectedLabels: map['showUnselectedLabels'] == null ? true : JsonClass.parseBool(map['showUnselectedLabels']),
        type: ThemeDecoder.decodeBottomNavigationBarType(map['type']) ?? BottomNavigationBarType.fixed,
        unselectedFontSize: JsonClass.parseDouble(map['unselectedFontSize'], 14.0)!,
        unselectedIconTheme: ThemeDecoder.decodeIconThemeData(map['unselectedIconTheme'], validate: false),
        unselectedItemColor: ThemeDecoder.decodeColor(map['unselectedItemColor']),
        unselectedLabelStyle: ThemeDecoder.decodeTextStyle(map['unselectedLabelStyle'])
      );
      return result;
    }
  }

  @override
  Widget buildCustom({ChildWidgetBuilder? childBuilder,
    required BuildContext context,
    required JsonWidgetData data,
    Key? key}) {
    assert (
      data.children?.isNotEmpty != true,
      '[JsonBottomNavigationBarBuilder] does not support children'
    );

    return BottomNavigationBar(
        items: items as List<BottomNavigationBarItem>,
        fixedColor: fixedColor,
        enableFeedback: enableFeedback,
        elevation: elevation,
        key: key,
        backgroundColor: backgroundColor,
        type: type,
        currentIndex: currentIndex,
        iconSize: iconSize,
        landscapeLayout: landscapeLayout,
        mouseCursor: mouseCursor,
        selectedFontSize: selectedFontSize,
        selectedIconTheme: selectedIconTheme,
        selectedItemColor: selectedItemColor,
        selectedLabelStyle: selectedLabelStyle,
        showSelectedLabels: showSelectedLabels,
        showUnselectedLabels: showUnselectedLabels,
        unselectedFontSize: unselectedFontSize,
        unselectedIconTheme: unselectedIconTheme,
        unselectedItemColor: unselectedItemColor,
        unselectedLabelStyle: unselectedLabelStyle,
        onTap: onTap,
    );
  }
}
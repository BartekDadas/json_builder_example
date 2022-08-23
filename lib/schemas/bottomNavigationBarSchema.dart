import 'package:flutter/material.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'bottomNavigationBarItemSchema.dart';

class BottomNavigationBarSchema {
  static const id = 'https://bartekdadas.github.io/schemas/bottom_nav_bar_schema.json'; //check and change

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id' : id,
    r'$comment' : 'https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html',
    'type' : 'object',
    'title' : 'BottomNavigationBar',
    'additionalProperties' : false,
    'properties' : {
      'backgroundColor' : SchemaHelper.objectSchema(ColorSchema.id),
      'currentIndex': SchemaHelper.numberSchema,
      'elevation' : SchemaHelper.numberSchema,
      'enableFeedback' : SchemaHelper.boolSchema,
      'fixedColor' : SchemaHelper.objectSchema(ColorSchema.id),
      'iconSize' : SchemaHelper.numberSchema,
      'items' : SchemaHelper.arraySchema(BottomNavigationBarItemSchema.id),
      'landscapeLayout' : SchemaHelper.objectSchema(BottomNavigationBarLandscapeLayoutSchema.id),
      'mouseCursor' : SchemaHelper.objectSchema(MouseCursorSchema.id),
      'onTap' : SchemaHelper.stringSchema,
      'selectedFontSize' : SchemaHelper.numberSchema,
      'selectedIconTheme' : SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'selectedItemColor' : SchemaHelper.objectSchema(ColorSchema.id),
      'selectedLabelStyle' : SchemaHelper.objectSchema(TextStyleSchema.id),
      'showSelectedLabels' : SchemaHelper.boolSchema,
      'showUnselectedLabels' : SchemaHelper.boolSchema,
      'type' : SchemaHelper.objectSchema(BottomNavigationBarTypeSchema.id),
      'unselectedFontSize' : SchemaHelper.numberSchema,
      'unselectedIconTheme' : SchemaHelper.objectSchema(IconThemeDataSchema.id),
      'unselectedItemColor' : SchemaHelper.objectSchema(ColorSchema.id),
      'unselectedLabelStyle' : SchemaHelper.objectSchema(TextStyleSchema.id)
    }
  };
}

import 'package:json_theme/json_theme_schemas.dart';
import 'package:json_dynamic_widget/json_dynamic_widget_schemas.dart';

class BottomNavigationBarItemSchema {
  static const id = 'https://bartekdadas.github.io/schemas/bottom_nav_bar_item_schema.json';

  static final schema = {
    r'$schema' : 'http://json-schema.org/draft-06/schema#',
    r'$id' : id,
    r'$comment' : 'https://api.flutter.dev/flutter/widgets/BottomNavigationBarItem-class.html',
    'type' : 'object',
    'title': 'BottomNavigationBarItem',
    'additionalProperties' : false,
    'properties' : {
      'activeIcon' : SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'backgroundColor' : SchemaHelper.objectSchema(ColorSchema.id),
      'icon' : SchemaHelper.objectSchema(JsonWidgetDataSchema.id),
      'label' : SchemaHelper.stringSchema,
      'tooltip' : SchemaHelper.stringSchema
    }
  };
}
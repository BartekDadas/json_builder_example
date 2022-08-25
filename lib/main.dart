import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:test_json2/schemas/bottomNavigationBarItemSchema.dart';
import 'package:test_json2/schemas/bottomNavigationBarSchema.dart';
import 'builders/bottom_navigation_bar_builder.dart';
import 'builders/bottom_navigation_bar_item_builder.dart';
import 'package:json_dynamic_widget_plugin_material_icons/json_dynamic_widget_plugin_material_icons.dart';
import 'package:json_theme/json_theme_schemas.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map mapData = {};
  @override
  Widget build(BuildContext context) {
    var registry = JsonWidgetRegistry.instance;
    JsonMaterialIconsPlugin.bind(registry);
    SchemaCache cache = SchemaCache();

    cache.addSchema(BottomNavigationBarSchema.id, BottomNavigationBarSchema.schema);
    cache.addSchema(BottomNavigationBarItemSchema.id, BottomNavigationBarItemSchema.schema);

    registry.registerCustomBuilder(JsonBottomNavigationBarBuilder.kType,
        const JsonWidgetBuilderContainer(
            builder: JsonBottomNavigationBarBuilder.fromDynamic,
            schemaId: BottomNavigationBarSchema.id
        )
    );
    // registry.registerCustomBuilder(
    //     JsonBottomNavigationBarItemBuilder.type,
    //     const JsonWidgetBuilderContainer(
    //         builder: JsonBottomNavigationBarItemBuilder.fromDynamic,
    //         schemaId: BottomNavigationBarItemSchema.id
    //     )
    // );


    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: FutureBuilder(
            future: readJson().then((value) => mapData = value),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var widget = JsonWidgetData.fromDynamic(mapData, registry: registry);
                return widget!.build(context: context);
                // return Center(child: Text(mapData.toString()));
              }
              else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        )
    );
  }
  Future<Map> readJson() async {
    final response = await rootBundle.loadString("assets/json/model.json");
    final data = await json.decode(response);
    return data;
  }
}

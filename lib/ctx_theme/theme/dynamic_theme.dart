import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:yaml/yaml.dart';

class DynamicLoginTheme extends ChangeNotifier {
  DynamicLoginTheme(DynamicTheme parent);
  final Map<String, Color> _colors = {
    "primary": Colors.black,
    "accent": Colors.black,
    "error": Colors.black,
    "page_color_light": Colors.black,
    "page_color_dark": Colors.black
  };

  void assignColor(String color, Color value) {
    if (_colors.containsKey(color)) {
      _colors[color] = value;
      notifyListeners();
    }
  }

  Color get primaryColor => _colors["primary"]!;
  set primaryColor(Color value) => assignColor("primary", value);

  Color get accentColor => _colors["accent"]!;
  set accentColor(Color value) => assignColor("accent", value);

  Color get errorColor => _colors["error"]!;
  set errorColor(Color value) => assignColor("error", value);

  Color get pageColorLight => _colors["page_color_light"]!;
  set pageColorLight(Color value) => assignColor("page_color_light", value);

  Color get pageColorDark => _colors["page_color_dark"]!;
  set pageColorDark(Color value) => assignColor("page_color_dark", value);
}

class DynamicTheme extends ChangeNotifier {
  static String defaultAssetPath = "assets/theme/default_theme.yaml";
  late final DynamicLoginTheme login;
  final Map<String, Color> _colors = {"primary": Colors.black};

  void assignColor(String color, Color value) {
    if (_colors.containsKey(color)) {
      _colors[color] = value;
      notifyListeners();
    }
  }

  DynamicTheme() {
    login = DynamicLoginTheme(this);

    login.addListener(() {
      notifyListeners();
    });
  }
  ThemeData get materialLightTheme => ThemeData(primarySwatch: Colors.green);
  ThemeData get materialDarkTheme => ThemeData(primarySwatch: Colors.purple);

  Color get primaryColor => _colors["primary"]!;
  set primaryColor(Color value) => assignColor("primary", value);

  static Future<DynamicTheme> fromYAML(String yaml) {
    final DynamicTheme dynamicTheme = DynamicTheme();

    Color parseColor(dynamic value) {
      if (value == null) return Colors.black;

      if (value != null &&
          value["r"] != null &&
          value["g"] != null &&
          value["b"] != null) {
        return Color.fromRGBO(
            value["r"], value["g"], value["b"], value["opacity"] ?? 100);
      } else if (value["name"] != null) {
        switch (value["name"]) {
          case "red":
            return (value["accent"] ?? false) ? Colors.redAccent : Colors.red;
          case "blue":
            return (value["accent"] ?? false) ? Colors.blueAccent : Colors.blue;
          case "pink":
            return (value["accent"] ?? false) ? Colors.pinkAccent : Colors.pink;
          case "purple":
            return (value["accent"] ?? false)
                ? Colors.purpleAccent
                : Colors.purple;
          case "amber":
            return (value["accent"] ?? false)
                ? Colors.amberAccent
                : Colors.amber;
          case "green":
            return (value["accent"] ?? false)
                ? Colors.greenAccent
                : Colors.green;
        }
      } else {
        return Colors.black;
      }

      return Colors.black;
    }

    final yamlDoc = loadYaml(yaml);
    dynamicTheme.login.primaryColor =
        parseColor(yamlDoc["theme"]["login"]["colors"]["primary"]);
    dynamicTheme.login.accentColor =
        parseColor(yamlDoc["theme"]["login"]["colors"]["accent"]);
    dynamicTheme.login.errorColor =
        parseColor(yamlDoc["theme"]["login"]["colors"]["error"]);
    dynamicTheme.login.pageColorLight =
        parseColor(yamlDoc["theme"]["login"]["colors"]["page_color_light"]);
    dynamicTheme.login.pageColorDark =
        parseColor(yamlDoc["theme"]["login"]["colors"]["page_color_dark"]);

    dynamicTheme.primaryColor =
        parseColor(yamlDoc["theme"]["colors"]["primary"]);

    return SynchronousFuture(
      dynamicTheme,
    );
  }
}

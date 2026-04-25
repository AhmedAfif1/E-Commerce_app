import 'dart:convert';

List<String> categoriesModelFromJson(str) =>
    List<String>.from(json.decode(str).map((x) => x));

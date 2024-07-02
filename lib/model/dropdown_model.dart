

import 'dart:convert';

DropdownModel dropdownModelFromMap(String str) =>
    DropdownModel.fromMap(json.decode(str));

String dropdownModelToMap(DropdownModel data) => json.encode(data.toMap());

class DropdownModel {
  final String? id;
  final String? name;

  DropdownModel({
    this.id,
    this.name,
  });

  DropdownModel copyWith({
    String? id,
    String? name,
  }) =>
      DropdownModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory DropdownModel.fromMap(Map<String, dynamic> json) => DropdownModel(
    id: json["id"],
    name: json["district_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}

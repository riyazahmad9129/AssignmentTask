

import 'dart:convert';

DropdownModel2 dropdownModelFromMap(String str) =>
    DropdownModel2.fromMap(json.decode(str));

String dropdownModelToMap(DropdownModel2 data) => json.encode(data.toMap());

class DropdownModel2 {
  final String? id;
  final String? name;

  DropdownModel2({
    this.id,
    this.name,
  });

  DropdownModel2 copyWith({
    String? id,
    String? name,
  }) =>
      DropdownModel2(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory DropdownModel2.fromMap(Map<String, dynamic> json) => DropdownModel2(
    id: json["id"],
    name: json["state_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}

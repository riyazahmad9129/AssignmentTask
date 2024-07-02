// To parse this JSON data, do
//
//     final stateModel = stateModelFromMap(jsonString);

import 'dart:convert';

StateModel stateModelFromMap(String str) => StateModel.fromMap(json.decode(str));

String stateModelToMap(StateModel data) => json.encode(data.toMap());

class StateModel {
  String? id;
  String? stateName;

  StateModel({
    this.id,
    this.stateName,
  });

  factory StateModel.fromMap(Map<String, dynamic> json) => StateModel(
    id: json["id"],
    stateName: json["state_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "state_name": stateName,
  };
}

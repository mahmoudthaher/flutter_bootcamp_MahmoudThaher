import 'package:flutter/material.dart';

class UserModel {
  String? _fullName;
  String? firstName;
  String? lastName;

  String get fullName => _fullName!;

  String get getFullName => "$firstName $lastName";

  set fullName(String fullName) {
    _fullName = fullName;
  }

  Widget get widget => Text("$getFullName");
}

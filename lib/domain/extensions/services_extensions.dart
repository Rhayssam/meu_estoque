import 'package:flutter/material.dart';
import 'package:meu_estoque/domain/enums/services_enum.dart';

extension ServicesExtensions on ServicesEnum {
  IconData get icon => switch (this) {
    ServicesEnum.products => Icons.toys,
  };
}

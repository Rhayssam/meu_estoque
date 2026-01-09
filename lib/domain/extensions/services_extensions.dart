import 'package:flutter/material.dart';
import 'package:meu_estoque/domain/enums/services_enum.dart';

extension CompanyServicesExtensions on ServicesEnum {
  IconData get icon => switch (this) {
    ServicesEnum.companies => Icons.list,
  };
}

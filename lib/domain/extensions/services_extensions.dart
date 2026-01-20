import 'package:flutter/material.dart';
import 'package:meu_estoque/domain/enums/services_enum.dart';

extension ServicesExtensions on ServicesEnum {
  IconData get icon => switch (this) {
    ServicesEnum.products => Icons.toys_outlined,
    ServicesEnum.sales => Icons.sell_outlined,
    ServicesEnum.inventory => Icons.inventory_2_outlined,
  };
}

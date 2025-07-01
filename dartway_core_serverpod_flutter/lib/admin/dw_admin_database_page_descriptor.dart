import 'package:flutter/material.dart';

abstract class DwAdminDatabasePageDescriptor implements Enum {
  DwAdminDatabasePageDescriptor(this.pageDescriptor);

  final DwADPD pageDescriptor;
}

class DwADPD {
  const DwADPD({required this.pageTitle, required this.entityManagerBlock});
  final String pageTitle;
  final Widget entityManagerBlock;
}

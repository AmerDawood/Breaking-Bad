
import 'package:flutter/material.dart';

import '../../../data/models/death.dart';

@immutable
abstract class DeathsState {}

class DeathInitial extends DeathsState {}


class DeathsLoaded extends DeathsState {
  final List<Death> death;

  DeathsLoaded(this.death);
}



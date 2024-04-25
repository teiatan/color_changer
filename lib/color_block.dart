import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

class PinkColorEvent extends ColorEvent {}
class BlueColorEvent extends ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.red) {
    on<PinkColorEvent>((event, emit) => emit(Colors.pink.shade200));
    on<BlueColorEvent>((event, emit) => emit(Colors.blue.shade200));
  }
}
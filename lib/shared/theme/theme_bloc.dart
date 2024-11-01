import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// Theme Event
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ToggleThemeEvent extends ThemeEvent {}

class SwitchDrawerEvent extends ThemeEvent {}

// Theme State
class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final bool isDrawerExpanded;

  const ThemeState({
    this.themeMode = ThemeMode.light,
    this.isDrawerExpanded = false,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? isDrawerExpanded,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      isDrawerExpanded: isDrawerExpanded ?? this.isDrawerExpanded,
    );
  }

  @override
  List<Object> get props => [themeMode, isDrawerExpanded];
}

// Theme Bloc
class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState(themeMode: ThemeMode.light)) {
    // Register event handler
    on<ToggleThemeEvent>((event, Emitter<ThemeState> emit) async {
      emit(
        state.copyWith(
          themeMode: state.themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light,
        ),
      );
    });

    on<SwitchDrawerEvent>((event, Emitter<ThemeState> emit) async {
      emit(
        state.copyWith(
          isDrawerExpanded: !state.isDrawerExpanded,
        ),
      );
    });
  }
}

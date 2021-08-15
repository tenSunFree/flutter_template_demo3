import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MainNavigatorState extends Equatable {
  const MainNavigatorState._(this.prevState);

  const factory MainNavigatorState.splash() = SplashNavigatorState;

  const factory MainNavigatorState.home(MainNavigatorState prevState) =
      HomeNavigatorState;

  final MainNavigatorState? prevState;

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return this.runtimeType.toString() + '(prevState: $prevState)';
  }
}

@immutable
class SplashNavigatorState extends MainNavigatorState {
  const SplashNavigatorState() : super._(null);
}

@immutable
class HomeNavigatorState extends MainNavigatorState {
  const HomeNavigatorState(MainNavigatorState prevState)
      : super._(prevState);
}

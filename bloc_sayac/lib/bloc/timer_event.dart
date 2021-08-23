import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class TimerEvent extends Equatable {

  TimerEvent();

  @override
  List<Object> get props => [];

}

class TimerStarted extends TimerEvent {
  final int duration;

  TimerStarted({@required this.duration});

}

class TimerPaused extends TimerEvent {}

class TimerResumed extends TimerEvent {}

class TimerReset extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int duration;

  TimerTicked({@required this.duration});
  
}
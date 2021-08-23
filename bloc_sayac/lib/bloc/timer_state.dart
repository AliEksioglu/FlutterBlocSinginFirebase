import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {

  final int duration;

  TimerState({this.duration});

  @override
  List<Object> get props => [duration] ;
}

class TimerInitial extends TimerState {

  TimerInitial(int _duration): super(duration: _duration);

}

class TimerRunPause extends TimerState {
  TimerRunPause(int _duration): super(duration: _duration);
}

class TimerRunInProgress extends TimerState {
  TimerRunInProgress(int _duration) : super(duration: _duration);


}

class TimerRunComplete extends TimerState {
  TimerRunComplete() : super(duration: 0);
}
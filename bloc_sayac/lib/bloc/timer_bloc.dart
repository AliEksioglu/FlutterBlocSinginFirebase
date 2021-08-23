import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sayac/bloc/timer_event.dart';
import 'package:bloc_sayac/bloc/timer_state.dart';
import 'package:bloc_sayac/ticker.dart';

class TimerBloc extends Bloc<TimerEvent,TimerState> {
  final Ticker ticker;
  TimerBloc({this.ticker}):
        assert (ticker != null),
        super(TimerInitial(60));

  StreamSubscription<int> _tickerSubscription;

  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if(event is TimerStarted) {
      yield* _mapTimerStartedToState(event);

    }
  }

}
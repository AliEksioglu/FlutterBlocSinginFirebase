import 'package:flutter/foundation.dart';

abstract class CatsState {
  const CatsState();
}

class CatsInitial extends CatsState {
  const CatsInitial();
}

class CatsLoading extends CatsState {

  const CatsLoading();

}

class CatsCompleted extends CatsState {
  final List<String> response;

  const CatsCompleted({this.response});

  bool operator == (Object o) {
    if (identical(this, o)) return true;

    return o is CatsCompleted && listEquals(o.response, response);
  }

  int get hashCode => response.hashCode;

}

class CatsError extends CatsState {
  final String errorMessage;

  const CatsError({this.errorMessage});
}

class CatsBack extends CatsState {
  const CatsBack();
}





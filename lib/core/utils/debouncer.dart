import 'dart:async';

typedef DebounceCallBack = void Function();

class DeBouncer {
  DeBouncer({
    required this.interval,
  });
  final Duration interval;

  ///Call back function
  DebounceCallBack? _action;
  Timer? _timer;
  void call(DebounceCallBack action) {
    _action = action;
// Cancel the previous request it there is one existing
    _timer?.cancel();
    //Start a new timer
    _timer = Timer(interval, _callAction);
  }

//Call the action and reset the timer void
  void _callAction() {
    _action?.call();
    _timer = null;
  }

//Reset the bouncer
  void reset() {
    _action = null;
    _timer = null;
  }
}

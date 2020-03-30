import 'package:calendar/core/base/base_view_model.dart';
import 'package:flutter/src/animation/animation_controller.dart';

class HomeViewModel extends BaseViewModel {
  int _counter;

  HomeViewModel({int counter = 0}) : this._counter = counter;

  int get counter => this._counter;

  set controller(AnimationController controller) {}
  set counter(int value) {
    this._counter = value;
    log.i('123');
    notifyListeners();
  }

  void increment() => 
     this.counter += 1;
  
}
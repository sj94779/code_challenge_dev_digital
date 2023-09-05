import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../model/list_item_model.dart';

class HomePageGetController extends GetxController {
  final RxList<Task> _todos = <Task>[Task.empty()].obs;

  RxList<Task> get todos => _todos;

  final RxList<TextEditingController> valueController =
      <TextEditingController>[TextEditingController()].obs;

  final RxList<Timer> timer =
      <Timer>[Timer.periodic(const Duration(), (_) {})].obs;

  final RxList<Duration> duration = <Duration>[const Duration()].obs;
  RxInt last = 0.obs;

  void startTimer(
      {bool resets = true, required Task todo, required int index}) {
    todo = todo.copyWith(isRunning: true);
    todos.replaceRange(index, index + 1, [todo]);
    timer[index] = Timer.periodic(
        const Duration(seconds: 1), (_) => startCountdown(todo, index));
  }

  void startCountdown(Task todo, int index) {
    const subtractSeconds = -1;

    final seconds = duration[index].inSeconds + subtractSeconds;

    if (seconds < 0) {
      timer[index].cancel();
      todo = todo.copyWith(isRunning: false, count: 0);
      todos.replaceRange(index, index + 1, [todo]);
      duration[index] = const Duration(seconds: 0);
      updateTimer(todo, index);
    } else {
      duration[index] = Duration(seconds: seconds);
      last.value = seconds;
      updateTimer(todo, index);
    }
  }

  Future updateTimer(Task todo, int index) async {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    todo = todo.copyWith(
        duration:
            '${twoDigits(duration[index].inHours)}:${twoDigits(duration[index].inMinutes.remainder(60))}:${twoDigits(duration[index].inSeconds.remainder(60))}');
    todos.replaceRange(index, index + 1, [todo]);
  }

  void stopTimer({bool resets = true, required Task todo, required int index}) {
    todo = todo.copyWith(isRunning: false);
    todos.replaceRange(index, index + 1, [todo]);

    if (resets) {
      reset(index);
    }

    updateTimer(todo, index);
    timer[index].cancel();
  }

  void reset(int index) {
    duration[index] = Duration(seconds: last.value);
  }

  Future addNewTimer() async {
    _todos.add(Task.empty());
    valueController.add(TextEditingController());
    timer.add(Timer.periodic(const Duration(), (_) {}));
    duration.add(const Duration());
  }
}

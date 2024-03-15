import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/services/models.dart';

class QuizState with ChangeNotifier {
  double _progress = 0;
  Option? _selected;
  PageController controller = PageController();

  double get progress => _progress;
  Option? get selected => _selected;

  set progress(double newValue) {
    _progress = newValue;
    notifyListeners();
  }

  set selected(Option? newValue) {
    _selected = newValue;
    notifyListeners();
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
    );
  }
}

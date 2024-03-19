import 'package:flutter/material.dart';
import 'package:home_tasks/data/local/storage_repository.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculateViewModel extends ChangeNotifier {
  String userInput = '';
  String answer = '';

  void equalPressed() {
    String finalUserInput = userInput.replaceAll('x', '*').replaceAll('÷', '/');

    if (finalUserInput.contains('%')) {
      finalUserInput = finalUserInput.replaceAll(' ', '');

      List<String> parts = finalUserInput.split('%');

      Parser p = Parser();
      Expression exp1 = p.parse(parts[0]);
      ContextModel cm = ContextModel();
      double eval1 = exp1.evaluate(EvaluationType.REAL, cm);

      if (parts.length == 2) {
        Expression exp2 = p.parse(parts[1]);
        double eval2 = exp2.evaluate(EvaluationType.REAL, cm);
        eval1 = eval1 * eval2 / 100;
      }

      answer = eval1.toString();
      userInput=answer;

    } else {
      Parser p = Parser();
      Expression exp = p.parse(finalUserInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      answer = eval.toString();
      userInput=answer;
    }

    notifyListeners();
  }


  void addInput(String input) {
    if (input!='÷'&& input!='+' && input!='-' && input!='x') {
      userInput += input;
    }
    else {
      if (!userInput.contains(input)) {
        userInput += input;
      }
    }
    notifyListeners();
  }

  void deleteLast() {
    if (userInput.isNotEmpty) {
      userInput = userInput.substring(0, userInput.length - 1);
      notifyListeners();
    }
  }

  void clear() {
    userInput = '';
    answer = '0';
    notifyListeners();
  }

  void save() {
    StorageRepository.setString(key: "input", value: userInput);
    StorageRepository.setString(key: "answer", value: answer);
    notifyListeners();
  }
  void getSave() {
    userInput=StorageRepository.getString(key: "input");
    answer=StorageRepository.getString(key: "answer");
    notifyListeners();
  }
}

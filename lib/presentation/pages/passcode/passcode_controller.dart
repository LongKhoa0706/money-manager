import 'dart:async';

import 'package:money_manager/core/contracts/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasscodeController implements Controller {
  PasscodeController() {
    SharedPreferences.getInstance().then((shared) {
      _correct = shared.getString('passcode') ?? '4444';
    });
  }

  final _passcodeController = StreamController<String>();
  Stream<String> get passcodeStream => _passcodeController.stream;

  final int length = 4;
  String _correct;

  String _passcode = '';
  String get passcode => _passcode;

  void enter(String value) {
    if (_passcode.length < _correct.length) {
      _passcode += value;
      _passcodeController.add(_passcode);
      if (_passcode.length == _correct.length) {
        if (_passcode == _correct) {
          print('access');
        }
      }
    }
  }

  void delete() {
    if (_passcode.length > 0) {
      _passcode = _passcode.substring(0, _passcode.length - 1);
    }

    _passcodeController.add(_passcode);
  }

  @override
  void dispose() {
    _passcodeController.close();
  }
}

import 'package:flutter/material.dart';
import 'package:money_manager/presentation/shared/circle_dot.dart';
import 'package:money_manager/presentation/shared/digit_keyboard/digit_keyboard.dart';

import 'passcode_controller.dart';

class PasscodePage extends StatefulWidget {
  /// Create a PasscodePage widget.
  PasscodePage({
    Key key,
  }): super(key: key);

  /// Creates the mutable state for this widget at a given location in the tree.
  @override
  State<PasscodePage> createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  PasscodeController controller;

  /// Called when this state first inserted into tree.
  @override
  void initState() {
    super.initState();
    controller = PasscodeController();
  }

  /// Called when a dependency of this state object changes.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /// Called whenever the widget configuration changes.
  @override
  void didUpdateWidget(PasscodePage old) {
    super.didUpdateWidget(old);
  }

  /// Called when this state removed from the tree.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// Build the widget with this state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.red[300],
                      Colors.orange[600],
                    ],
                  ),
                ),
                margin: const EdgeInsets.symmetric(vertical: 24),
                height: 84,
                width: 84,
                child: Image.asset('assets/image/iconmoney.png'),
              ),
              Text(
                'Enter Your Passcode',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              StreamBuilder<String>(
                initialData: controller.passcode,
                stream: controller.passcodeStream,
                builder: (context, snapshot) {
                  var children = <Widget>[];
                  for (var i = 0; i < controller.length; i++) {
                    children.add(
                      CircleDot(
                        enable: i < snapshot.data.length,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                    );
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: children,
                  );
                },
              ),
              DigitKeyboard(
                onPressed: (value) {
                  controller.enter(value);
                },
                onDeletePressed: () {
                  controller.delete();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/resources/strings_manager.dart';

class OtpVerifyWidget extends StatefulWidget {
  const OtpVerifyWidget(
      {super.key, required this.password, required this.phone});
  final String password;
  final String phone;

  @override
  State<OtpVerifyWidget> createState() => _OtpVerifyWidgetState();
}

class _OtpVerifyWidgetState extends State<OtpVerifyWidget> {
  final countDownController = CountDownController();

  @override
  void dispose() {
    countDownController.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StringsManager.verification,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            StringsManager.enterPINcode,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gutter(),
          Text(
            widget.phone,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Gutter(),
          CircularCountDownTimer(
            width: 150.w,
            height: 100.h,
            duration: 300,
            fillColor: Theme.of(context).colorScheme.primary,
            ringColor: Theme.of(context).colorScheme.onPrimary,
            isReverse: true,
            isReverseAnimation: true,
            controller: countDownController,
          ),
          const Gutter(),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Pinput(
                length: 6,
                onCompleted: (pin) {
                  context.pop();
                },
                autofillHints: const [AutofillHints.oneTimeCode],
                toolbarEnabled: false,
              ),
            ),
          ),
          const Gutter(),
          Text(
            '${StringsManager.didNotReceiveCode}?',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const GutterSmall(),
          TextButton(
            onPressed: () async {
              countDownController.restart();
            },
            child: Text(
              StringsManager.resend,
            ),
          ),
          const Gutter.extraLarge(),
        ],
      ),
    );
  }
}

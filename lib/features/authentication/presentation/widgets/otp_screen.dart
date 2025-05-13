import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/resources/strings_manager.dart';

class OtpVerifyWidget extends StatefulWidget {
  const OtpVerifyWidget({super.key, required this.password, required this.phone});
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
    return Column(
      children: [
        Text(
          StringsManager.verification,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          StringsManager.enterPINcode,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 30.h,
        ),
        Text(
          widget.phone,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 30.h,
        ),
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
        SizedBox(
          height: 30.h,
        ),
        Pinput(
          length: 6,
          onCompleted: (pin) {},
          autofillHints: const [AutofillHints.oneTimeCode],
          toolbarEnabled: false,
        ),
        SizedBox(
          height: 30.h,
        ),
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
        )
      ],
    );
  }
}

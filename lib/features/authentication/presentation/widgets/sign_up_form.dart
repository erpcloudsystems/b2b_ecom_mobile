// import 'package:class_a_ec/core/resources/strings_manager.dart';
// import 'package:class_a_ec/core/utils/custom_drop_down_widget.dart';
// import 'package:class_a_ec/core/utils/custom_text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gutter/flutter_gutter.dart';

// class SignUpForm extends StatelessWidget {
//   const SignUpForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomTextFormField(
//             title: StringsManager.fullName,
//           ),
//           const Gutter(),
//           CustomTextFormField(
//             title: StringsManager.mobileNumber,
//           ),
//           const Gutter(),
//           CustomTextFormField(
//             title: StringsManager.password,
//             isPassword: true,
//           ),
//           const Gutter(),
//           CustomTextFormField(title: StringsManager.facilityName),
//           const Gutter(),
//           Text(
//             StringsManager.facilityType,
//             style: Theme.of(context).textTheme.bodyLarge,
//           ),
//           const GutterTiny(),
//           CustomDropDownFormField(
//             dropDownList: [
//               StringsManager.type,
//               StringsManager.type,
//               StringsManager.type
//             ],
//           ),
//           const Gutter(),
//         ],
//       ),
//     );
//   }
// }

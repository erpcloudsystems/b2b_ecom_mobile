import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/colors_managers.dart';

class UserHeaderWidget extends StatelessWidget {
  const UserHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: ColorsManager.white,
      leading: CircleAvatar(
        radius: 25.r,
        backgroundImage: const NetworkImage(
          'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?t=st=1746449396~exp=1746452996~hmac=3911f842d074bc15288d4fa7380c06c598351c2953e5b8f2835a84cfb7a3d8f2&w=996',
        ),
      ),
      title: Text(
        'Mostafa Mahmoud',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: ColorsManager.white,
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
            ),
      ),
      subtitle: const Text('mostafa.ecs@gmail.com'),
    );
  }
}

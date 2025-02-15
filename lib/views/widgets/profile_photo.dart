import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/avatar_helper.dart';

class ProfilePhoto extends StatelessWidget {
  final String avatarUrl;

  const ProfilePhoto({required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundImage: AvatarHelper.getImage(avatarUrl),
    );
  }
}

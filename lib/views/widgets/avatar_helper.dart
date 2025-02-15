import 'dart:io';
import 'package:flutter/material.dart';

class AvatarHelper {
  static ImageProvider getImage(String avatarUrl) {
    if (avatarUrl.isEmpty || avatarUrl == "assets/images/no_image.png") {
      return const AssetImage("assets/images/no_image.png");
    } else if (avatarUrl.startsWith('http') || avatarUrl.startsWith('https')) {
      return NetworkImage(avatarUrl);
    } else {
      try {
        final file = File(avatarUrl);
        if (file.existsSync()) {
          return FileImage(file);
        } else {
          return const AssetImage("assets/images/no_image.png");
        }
      } catch (e) {
        return const AssetImage("assets/images/no_image.png");
      }
    }
  }
}

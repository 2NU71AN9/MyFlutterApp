import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';

class SLAlert {
  static toast(
    String? title, {
    Duration? duration = const Duration(seconds: 2),
    VoidCallback? onClose,
  }) {
    if (title != null) {
      BotToast.showText(text: title, duration: duration, onClose: onClose);
    }
  }

  static CancelFunc loading() => BotToast.showLoading();
}

import 'package:flutter/material.dart';

extension AnimationControllerExtension on ScrollController {
  void scrollToEnd() {
    if (hasClients) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () => animateTo(
          position.maxScrollExtent,
          duration: const Duration(milliseconds: 100),
          curve: Curves.linear,
        ),
      );
    }
  }
}

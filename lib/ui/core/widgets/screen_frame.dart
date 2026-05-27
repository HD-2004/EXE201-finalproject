import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';

class ScreenFrame extends StatelessWidget {
  const ScreenFrame({
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 12, 16, 24),
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSpacing.maxContentWidth,
              ),
              child: Padding(padding: padding, child: child),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vershina_salon/app/theme/design_tokens.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({
    required this.child,
    this.padding,
    this.borderRadius,
    super.key,
  });

  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DesignTokens.cardBackground,
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        border: Border.all(color: DesignTokens.border),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.22),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}

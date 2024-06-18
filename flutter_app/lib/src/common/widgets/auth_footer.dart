import 'package:flutter/material.dart';
import 'package:flutter_app/src/utils/constants/palette.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    super.key,
    required this.helper,
    required this.link,
    required this.onTap,
  });
  final String helper, link;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: helper,
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            TextSpan(
              text: link,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Palette.grey8, decoration: TextDecoration.underline),
            ),
          ],
        ),
      ),
    );
  }
}

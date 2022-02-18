import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:app_qlorian/src/shared/theme/app_colors.dart';
import 'package:app_qlorian/src/shared/theme/app_text_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isIcon = false,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool? isIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        color: AppColors.appBarColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onPressed,
              icon: const Icon(Icons.arrow_back),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
            ),
            Text(
              title,
              style: AppTextTheme.title,
            ),
            SizedBox(
              width: double.infinity,
              height: 30,
              child: Row(
                children: [
                  Text(
                    subtitle,
                    style: AppTextTheme.subtitle,
                  ),
                  isIcon!
                      ? TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 4),
                          ),
                          child: Text(
                            'Login',
                            style: GoogleFonts.nunitoSans(
                              color: AppColors.textColor,
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 200);
}

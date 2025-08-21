import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';

class AppBarEmpty extends StatelessWidget implements PreferredSizeWidget {
  final bool? isGradient;
  const AppBarEmpty({
    super.key,
    this.isGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: isGradient == true
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF58E4BA), // #58E4BA
                  Color(0xFF58E4BA), // #58E4BA
                  Color(0xFF48CDA5), // #48CDA5
                ],
              )
            : null,
      ),
      child: AppBar(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor:
            isGradient == true ? Colors.transparent : lightGreen2Color,
        // backgroundColor: lightGreen2Color,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}

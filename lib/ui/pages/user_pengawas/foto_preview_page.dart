import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class FotoPreviewPage extends StatelessWidget {
  const FotoPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: '',
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          color: green1Color,
        ),
      ),
    );
  }
}

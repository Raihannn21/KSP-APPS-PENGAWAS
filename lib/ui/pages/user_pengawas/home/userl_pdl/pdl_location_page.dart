import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';

class PdlLocationPage extends StatefulWidget {
  const PdlLocationPage({Key? key}) : super(key: key);

  @override
  State<PdlLocationPage> createState() => _PdlLocationPageState();
}

class _PdlLocationPageState extends State<PdlLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Lokasi PDL",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Image.asset('assets/images/im_full_maps.png'),
    );
  }
}

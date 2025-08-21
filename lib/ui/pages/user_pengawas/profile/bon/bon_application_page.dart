import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class BonApplicationPage extends StatefulWidget {
  const BonApplicationPage({Key? key}) : super(key: key);

  @override
  State<BonApplicationPage> createState() => _BonApplicationPageState();
}

class _BonApplicationPageState extends State<BonApplicationPage> {
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarPrimary(
        title: "Pengajuan Bon Sementara",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          children: [
            CustomInputText(
              title: "Nominal",
              controller: _nominalController,
              inputType: TextInputType.number,
              hintText: "0",
            ),
            const SizedBox(height: 18),
            CustomInputText(
              title: "Note",
              controller: _noteController,
              maxLines: 4,
              hintText: "Ketik disini..",
            ),
            const Spacer(),
            ButtonPrimary(
              title: "Kirim",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_status.dart';

class DoublePaymentLoanPage extends StatefulWidget {
  const DoublePaymentLoanPage({Key? key}) : super(key: key);

  @override
  State<DoublePaymentLoanPage> createState() => _DoublePaymentLoanPageState();
}

class _DoublePaymentLoanPageState extends State<DoublePaymentLoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStatus(
        title: "Double Pembayaran",
        status: "Lancar",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

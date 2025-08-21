// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/pages/user_pengawas/applyment/loan/form_personal_data_customer_page.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/customer/item_customer.dart';

class ListExistingLoanCustomerPage extends StatefulWidget {
  const ListExistingLoanCustomerPage({Key? key}) : super(key: key);

  @override
  State<ListExistingLoanCustomerPage> createState() =>
      _ListExistingLoanCustomerPageState();
}

class _ListExistingLoanCustomerPageState
    extends State<ListExistingLoanCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: "Pengajuan Pinjaman",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (contex, index) {
            return ItemCustomer(onTap: () {
              backScreen(context);
              nextScreen(context, FormPersonalDataCustomerPage());
            });
          },
        ),
      ),
    );
  }
}

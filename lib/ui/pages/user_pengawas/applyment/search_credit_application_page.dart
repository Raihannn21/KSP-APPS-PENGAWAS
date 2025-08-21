import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/card/card_background.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/credit_application/item_credit_application.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class SearchCreditApplicationPage extends StatefulWidget {
  const SearchCreditApplicationPage({Key? key}) : super(key: key);

  @override
  State<SearchCreditApplicationPage> createState() =>
      _SearchCreditApplicationPageState();
}

class _SearchCreditApplicationPageState
    extends State<SearchCreditApplicationPage> {
  final TextEditingController _searchController = TextEditingController();

  Widget _header() {
    return CardBackground(
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back,
              color: primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CustomInputText(
              title: null,
              backgorundColor: whiteColor,
              controller: _searchController,
              borderRadius: BorderRadius.circular(20),
            ),
          )
        ],
      ),
      padding: const EdgeInsets.only(
        left: marginPage,
        right: marginPage,
        top: 50,
        bottom: 28,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _header(),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              padding: const EdgeInsets.symmetric(
                  horizontal: marginPage, vertical: 20),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return ItemCreditApplication(onTap: () {});
              },
            ),
          )
        ],
      ),
    );
  }
}

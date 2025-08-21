// ignore_for_file: avoid_classes_with_only_static_members, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_await_in_return

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ksp_pengawas_monthly/constant/app_theme.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';

class ModalFilterInstallment {
  static Future show(
    BuildContext context, {
    bool visibleStatusInstallment = true,
  }) async {
    return await showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      backgroundColor: Colors.transparent,
      builder: (_) {
        return ModalFilterInstallmentView(
          visibleStatusInstallment: visibleStatusInstallment,
        );
      },
    );
  }
}

class ModalFilterInstallmentView extends StatefulWidget {
  final bool visibleStatusInstallment;
  const ModalFilterInstallmentView(
      {Key? key, required this.visibleStatusInstallment})
      : super(key: key);

  @override
  State<ModalFilterInstallmentView> createState() =>
      _ModalFilterInstallmentViewState();
}

class _ModalFilterInstallmentViewState
    extends State<ModalFilterInstallmentView> {
  String statusSelected = "";
  String resortSelected = "";
  String categorySelected = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () => backScreen(context),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.close),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                  visible: widget.visibleStatusInstallment,
                  child: SizedBox(height: 10)),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: Center(
                  child: Text(
                    "Status Angsuran",
                    style: blackTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: SizedBox(height: 16),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: Row(
                  children: ["Lancar", "Gejala Macet", "Macet"].map((e) {
                    return Expanded(
                      child: outlinedItemWidget(
                        itemSelected: statusSelected,
                        title: "$e",
                        onTap: (value) {
                          statusSelected = value;
                          setState(() {});
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: SizedBox(height: 16),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: Center(
                  child: Text(
                    "Kategori Anggota",
                    style: blackTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: SizedBox(height: 16),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: Row(
                  children: ["Umum", "Dinas", "Pensiun"].map((category) {
                    return Expanded(
                      child: outlinedItemWidget(
                        title: "$category",
                        itemSelected: categorySelected,
                        onTap: (value) {
                          categorySelected = value;
                          setState(() {});
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: SizedBox(height: 16),
              ),
              Visibility(
                visible: widget.visibleStatusInstallment,
                child: Center(
                  child: Text(
                    "Resort",
                    style: blackTextStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Resort 1",
                style: blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: ["1A", "1B", "1C", "1D", "1E"].map((e) {
                  return Expanded(
                    child: outlinedItemWidget(
                      itemSelected: resortSelected,
                      title: "$e",
                      onTap: (value) {
                        resortSelected = value;
                        setState(() {});
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                "Resort 2",
                style: blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: ["2A", "2B", "2C", "2D", "2E"].map((e) {
                  return Expanded(
                    child: outlinedItemWidget(
                      title: "$e",
                      itemSelected: resortSelected,
                      onTap: (value) {
                        resortSelected = value;
                        setState(() {});
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                "Resort 3",
                style: blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: ["3A", "3B", "3C", "3D", "3E"].map((e) {
                  return Expanded(
                    child: outlinedItemWidget(
                      title: "$e",
                      itemSelected: resortSelected,
                      onTap: (value) {
                        resortSelected = value;
                        setState(() {});
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              Text(
                "Resort 4",
                style: blackTextStyle.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: ["4A", "4B", "4C", "4D", "4E"].map((e) {
                  return Expanded(
                    child: outlinedItemWidget(
                      title: "$e",
                      itemSelected: resortSelected,
                      onTap: (value) {
                        resortSelected = value;
                        setState(() {});
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              ButtonPrimary(
                title: "Terapkan",
                onTap: () {
                  backScreen(context, {
                    "resort": resortSelected,
                    "status": statusSelected,
                    "category": categorySelected,
                  });
                },
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget outlinedItemWidget({
    required String title,
    required Function(String value) onTap,
    String? itemSelected,
  }) {
    return GestureDetector(
      onTap: () => onTap(title),
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: itemSelected == title ? green1Color.withOpacity(0.25) : null,
          border: Border.all(
            color: itemSelected == title
                ? green1Color
                : greyColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text("$title"),
      ),
    );
  }
}

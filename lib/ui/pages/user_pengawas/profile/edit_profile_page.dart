import 'package:flutter/material.dart';
import 'package:ksp_pengawas_monthly/constant/color.dart';
import 'package:ksp_pengawas_monthly/constant/ui_helper.dart';
import 'package:ksp_pengawas_monthly/domain/commons/nav_utils.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/appbar/appbar_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/button/button_primary.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/modal/modal_image_picker.dart';
import 'package:ksp_pengawas_monthly/ui/widgets/textfield/custom_input_text.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController =
      TextEditingController(text: "John Doe");
  final TextEditingController _emailController =
      TextEditingController(text: "johndoe@gmail.com");

  Widget photo() {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        ModalImagePicker.show(context);
      },
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: lightBlue1Color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.photo,
              color: primaryColor,
            ),
          ),
          Positioned(
            bottom: 10,
            right: -12,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: blue2Color, width: 2),
              ),
              child: const Icon(
                Icons.edit,
                color: blue2Color,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarPrimary(
        title: "Edit Profile",
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: marginPage, vertical: 20),
        child: Column(
          children: [
            photo(),
            const SizedBox(height: 30),
            CustomInputText(
              title: "Nama",
              controller: _nameController,
            ),
            const SizedBox(height: 18),
            CustomInputText(
              title: "Email",
              controller: _emailController,
            ),
            const Spacer(),
            ButtonPrimary(
              title: "Simpan",
              onTap: () {
                backScreen(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

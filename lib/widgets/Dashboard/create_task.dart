import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskez/Screens/Task/set_assignees.dart';
import 'package:taskez/Screens/Task/task_due_date.dart';
import 'package:taskez/Values/values.dart';
import 'package:taskez/widgets/BottomSheets/bottom_sheet_holder.dart';
import 'package:taskez/widgets/Chat/add_chat_icon.dart';
import 'package:taskez/widgets/Forms/form_input_unlabelled.dart';
import 'package:taskez/widgets/Forms/form_input_with%20_label.dart';
import 'package:taskez/widgets/dummy/profile_dummy.dart';

class CreateTaskBottomSheet extends StatelessWidget {
  CreateTaskBottomSheet({Key? key}) : super(key: key);

  TextEditingController _taskNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace10,
      Padding(
        padding: EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Icon(Icons.contacts, color: Colors.white),
            AppSpaces.horizontalSpace10,
            Text("Unity Dashboard  ",
                style: GoogleFonts.lato(
                    color: Colors.white, fontWeight: FontWeight.w700)),
            Icon(Icons.expand_more, color: Colors.white),
          ]),
          AppSpaces.verticalSpace20,
          Row(
            children: [
              Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: LinearGradient(colors: [
                        HexColor.fromHex("FD916E"),
                        HexColor.fromHex("FFE09B")
                      ]))),
              AppSpaces.horizontalSpace20,
              Expanded(
                child: UnlabelledFormInput(
                  placeholder: "Task Name ....",
                  keyboardType: "text",
                  controller: _taskNameController,
                  obscureText: false,
                ),
              ),
            ],
          ),
          AppSpaces.verticalSpace20,
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            InkWell(
              onTap: () {
                Get.to(() => SetAssigneesScreen());
              },
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ProfileDummy(
                    color: HexColor.fromHex("94F0F1"),
                    dummyType: ProfileDummyType.Image,
                    scale: 1.5,
                    image: "assets/man-head.png"),
                AppSpaces.horizontalSpace10,
                CircularCardLabel(
                  label: 'Assigned to',
                  value: 'Dereck Boyle',
                  color: Colors.white,
                )
              ]),
            ),
            InkWell(
              onTap: () {
                Get.to(() => TaskDueDate());
              },
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    width: 40 * 1.5,
                    height: 40 * 1.5,
                    decoration: BoxDecoration(
                        color: HexColor.fromHex("7DBA67"),
                        shape: BoxShape.circle),
                    child: Icon(Icons.calendar_today, color: Colors.white)),
                AppSpaces.horizontalSpace10,
                CircularCardLabel(
                  label: 'Due Date',
                  value: 'Today 3PM',
                  color: HexColor.fromHex("A9F49C"),
                )
              ]),
            )
          ]),
          // Spacer(),
          AppSpaces.verticalSpace20,

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: Utils.screenWidth * 0.6,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomSheetIcon(icon: Icons.local_offer_outlined),
                    Transform.rotate(
                        angle: 195.2,
                        child: BottomSheetIcon(icon: Icons.attach_file)),
                    BottomSheetIcon(icon: FeatherIcons.flag),
                    BottomSheetIcon(icon: FeatherIcons.image)
                  ]),
            ),
            AppAddIcon(
              scale: 0.8,
              color: AppColors.primaryAccentColor,
            )
          ])
        ]),
      )
    ]);
  }
}

class BottomSheetIcon extends StatelessWidget {
  final IconData icon;
  const BottomSheetIcon({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      iconSize: 32,
      onPressed: null,
    );
  }
}

class CircularCardLabel extends StatelessWidget {
  final String? label;
  final String? value;
  final Color? color;
  const CircularCardLabel({
    Key? key,
    this.label,
    this.color,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label!,
          style: GoogleFonts.lato(
              fontSize: 16, color: HexColor.fromHex("626777"))),
      AppSpaces.horizontalSpace20,
      AppSpaces.horizontalSpace20,
      Text(value!, style: GoogleFonts.lato(fontSize: 16, color: color))
    ]);
  }
}
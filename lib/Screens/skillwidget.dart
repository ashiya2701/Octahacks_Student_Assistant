import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:student_assistant_app/Controller/skills.dart';
import 'package:student_assistant_app/utilities/Skill.dart';
import 'package:student_assistant_app/utilities/constants.dart';

class MultiSelectDropDownScreen extends StatefulWidget {
  const MultiSelectDropDownScreen({Key? key}) : super(key: key);

  @override
  State<MultiSelectDropDownScreen> createState() => _MultiSelectDropDownScreenState();
}

class _MultiSelectDropDownScreenState extends State<MultiSelectDropDownScreen> {
  final AppDataController controller = Get.put(AppDataController());

  @override
  Widget build(BuildContext context) {
    List skillData = [];
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getSkillData();
    });


    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Skills',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
           // height: 170.0,
            child: GetBuilder<AppDataController>(
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: MultiSelectDialogField(
                    dialogHeight: 200,
                    items: controller.dropDownData,
                    title: const Text(
                      "Select skills",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    selectedColor: Colors.blue,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    buttonIcon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    buttonText: const Text(
                      "Select your strong skills",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onConfirm: (results) {
                      skillData = [];
                      for (var i = 0; i < results.length; i++) {
                        SkillModel data = results[i] as SkillModel;
                        print(data.skillname);
                        print(data.skillid);
                      }
                      print("data $skillData");
                    },
                  ),
                );
              },
            ),
          )
        ]);
  }



}


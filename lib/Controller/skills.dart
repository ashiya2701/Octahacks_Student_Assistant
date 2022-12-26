import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:student_assistant_app/utilities/Skill.dart';

class AppDataController extends GetxController{
  List<SkillModel> skillData=[];
  List<MultiSelectItem> dropDownData=[];
  getSkillData(){
    skillData.clear();
    dropDownData.clear();
    Map<String, dynamic> apiResponse={
      "code":200,
      "message":"Skills List",
      "data": [
        {"skillid":"1","skillname":"Java"},
        {"skillid":"2","skillname":"C++"},
        {"skillid":"3","skillname":"JavaScript"},
        {"skillid":"4","skillname":"Python"},
        {"skillid":"5","skillname":"Go"},
        {"skillid":"6","skillname":"Rust"},
        {"skillid":"7","skillname":"Flutter"},
        {"skillid":"8","skillname":"React"},
        {"skillid":"9","skillname":"MERN"},
        {"skillid":"10","skillname":"Django"},
        {"skillid":"11","skillname":"DSA"}
      ]

    };
    if(apiResponse['code']==200){
      List<SkillModel> tempSkillData=[];
      apiResponse['data'].forEach(
            (data){
          tempSkillData.add(
            SkillModel(
              skillid: data['skillid'],
              skillname: data['skillname'],
            ),
          );
        },
      );
      print(tempSkillData);
      skillData.addAll(tempSkillData);
      dropDownData=skillData.map((skilldata){
        return MultiSelectItem(skilldata,skilldata.skillname);
      }).toList();
      update();
    }else if(apiResponse['code']==400){
      print('Show error model why error occured');
    }else{
      print("show some error model like something went wrong");
    }
  }
}

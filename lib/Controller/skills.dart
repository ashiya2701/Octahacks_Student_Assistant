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
        {"skillid":"11","skillname":"DSA"},
        {"skillid": "12", "skillname": "HTML"},
        {"skillid": "13", "skillname": "Adobe Photoshop"},
        {"skillid": "14", "skillname": "Microsoft Excel"},
        {"skillid": "15", "skillname": "Machine Learning"},
        {"skillid": "16", "skillname": "Data Analysis"},
        {"skillid": "17", "skillname": "Canva"},
        {"skillid": "18", "skillname": "Product Management"},
        {"skillid": "19", "skillname": "Linux"},
        {"skillid": "20", "skillname": "Git"},
        {"skillid": "21", "skillname": "SQL"},
        {"skillid": "22", "skillname": "XML"},
        {"skillid": "23", "skillname": "DBMS"},
        {"skillid": "24", "skillname": "Swift"},
        {"skillid": "25", "skillname": "Consultancy"},
        {"skillid": "26", "skillname": "Blockchain Development"},
        {"skillid": "27", "skillname": "Adobe Lightroom"},
        {"skillid": "28", "skillname": "Flask"},
        {"skillid": "29", "skillname": "Kotlin"},
        {"skillid": "30", "skillname": "Web Development"},
        {"skillid": "31", "skillname": "Mongo DB"},
        {"skillid": "32", "skillname": "Designing"},
        {"skillid": "33", "skillname": "CSS"},
        {"skillid": "34", "skillname": "C#"},
        {"skillid": "35", "skillname": "C"},
        {"skillid": "37", "skillname": "R"},
        {"skillid": "38", "skillname": "MATLAB"},
        {"skillid": "39", "skillname": "Ruby"},
        {"skillid": "40", "skillname": "Shell"},
        {"skillid": "41", "skillname": "Objective-C"},
        {"skillid": "42", "skillname": "RapidQL"},
        {"skillid": "43", "skillname": "Figma"},
        {"skillid": "44", "skillname": "PHP"},
        {"skillid": "45", "skillname": "Backend Development"},
        {"skillid": "46", "skillname": "Frontend Development"},
        {"skillid": "47", "skillname": "Data Management"},
        {"skillid": "48", "skillname": "Data Science"},
        {"skillid": "49", "skillname": "Data Analysis"},
        {"skillid": "50", "skillname": "Software Development"},


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

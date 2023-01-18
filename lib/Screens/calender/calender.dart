import './UI/add_task_bar.dart';
import './UI/theme.dart';
import './UI/widgets/button.dart';
import './controller/task_controller.dart';
import './services/notification_services.dart';
import './services/theme_services.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import "./UI/widgets/button.dart";
import './UI/add_task_bar.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   runApp(const MyApp());
// }

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  // This widget is the root of your application.
  DateTime _selectedDate = DateTime.now();
  final _taskController = Get.put(TaskController());
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          SizedBox(
            height: 10,
          ),
          _showTasks(),
        ],
      ),
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, index) {
              print(_taskController.taskList.length);
              return GestureDetector(
                onTap: () {
                  _taskController.delete(_taskController.taskList[index]);
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: Colors.green,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    _taskController.taskList[index].title.toString(),
                  ),
                ),
              );
            });
      }),
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(DateFormat.yMMMMd().format(DateTime.now()),
                  style: subHeadingsStyle),
              Text(
                "Today",
                style: headingStyle,
              ),
            ],
          ),
        ),
        MyButton(
            label: "+ Add Task",
            onTap: () async {
              await Get.to(AddTaskPage());
              _taskController.getTask();
            })
      ]),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 60,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
        ),
        onDateChange: (date) {
          _selectedDate = date;
        },
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeServices().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/download.png"),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}

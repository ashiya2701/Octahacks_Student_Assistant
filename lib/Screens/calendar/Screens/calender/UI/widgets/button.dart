import 'package:flutter/material.dart';
import 'package:calender/UI/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          width: 120,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )),
    );
  }
}

// import 'package:flutter/material.dart';

// class MyButton extends StatelessWidget {
//   final String label;
//   final Function()? onTap;

//   MyButton(this.onTap,this.label);
  
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 120,
//       height: 60,
//       child: ElevatedButton(
//           style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.blue),
//               foregroundColor: MaterialStateProperty.all(Colors.white)),
//           onPressed: onTap,
//           child: Center(
//             child: Text(
//               label,
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//           )),
//     );
//   }
// }

import 'package:bodycare_ai/costanses/colors.dart';
import 'package:flutter/material.dart';

// class ButtonWidgate extends StatelessWidget {
//   ButtonWidgate({super.key, required this.text, required this.onPressed});
  final colors = constColors();
//   final String text;
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 38,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [colors.primaryColor, colors.secondaryColor],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor:
//               Colors.transparent, // لجعل لون الخلفية شفافًا لرؤية التدرج
//           shadowColor: Colors.transparent, // إزالة ظل الزر
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

class ButtonWidgate extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonWidgate({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ياخد عرض الشاشة كله
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient:  LinearGradient(
          colors: [
            colors.secondaryColor,
            colors.primaryColor,
            
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class TapOption extends StatelessWidget {
//   const TapOption({
//     super.key,
//     required this.text,
//     required this.onTap,
//   });
//
//   final String text;
//   final void Function() onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       width: 150,
//       height: 150,
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color.fromARGB(255, 47, 17, 93),
//           foregroundColor: Colors.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'package:flutter/material.dart';

class TapOption extends StatelessWidget {
  const TapOption({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10), // Adds spacing around the option
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3, // Responsive width
        height: MediaQuery.of(context).size.width * 0.3, // Responsive height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Rounded edges
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Subtle shadow
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2F115D), // Dark purple
            foregroundColor: Colors.white, // White text
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Match container radius
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2, // Slightly spaced letters
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

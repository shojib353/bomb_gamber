// import 'package:bomb_gamber/screen/widget/tap_option.dart';
// import 'package:flutter/material.dart';
//
// class StartScreen extends StatelessWidget {
//    StartScreen({super.key,
//     required this.onPressed,
//
//
//   });
//
//
//
//
//   final void Function(List<String>) onPressed;
//   final TextEditingController controller = TextEditingController();
//   final TextEditingController controller2 = TextEditingController();
//
//
//
//    @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             controller: controller,
//
//             style: const TextStyle(fontSize: 18, color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Enter Player 1 name',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10), // Rounded corners
//                 borderSide: const BorderSide(
//                   color: Colors.grey, // Default border color
//                   width: 1.0, // Default border width
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10), // Keep rounded corners when focused
//                 borderSide: const BorderSide(
//                   color: Colors.blue, // Border color when focused
//                   width: 2.0, // Border width when focused
//                 ),
//               ),
//             ),
//             onTap: () {
//               controller.clear(); // Clear value on tap
//             },
//           ),
//           SizedBox(height: 20),
//
//           TextFormField(
//             controller: controller2,
//
//             style: const TextStyle(fontSize: 18, color: Colors.black),
//             decoration: InputDecoration(
//               hintText: 'Enter Player 2 name',
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10), // Rounded corners
//                 borderSide: const BorderSide(
//                   color: Colors.grey, // Default border color
//                   width: 1.0, // Default border width
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10), // Keep rounded corners when focused
//                 borderSide: const BorderSide(
//                   color: Colors.blue, // Border color when focused
//                   width: 2.0, // Border width when focused
//                 ),
//               ),
//             ),
//             onTap: () {
//               controller2.clear(); // Clear value on tap
//             },
//           ),
//
//
//
//           ElevatedButton(onPressed:(){
//             onPressed(['${ (controller=="") ?controller.text:"player 1"}',
//               '${ (controller2=="") ?controller.text:"player 2"}']);
//           } , child: Text("Start Game")),
//
//         ],
//       ),
//     );
//   }
// }

























import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen({
    super.key,
    required this.onPressed,
  });

  final void Function(List<String>) onPressed;
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // App Name at the Top
          const Text(
            "Bomb Gambler",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50), // Space below app name

          // Player 1 Input
          TextFormField(
            controller: controller,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              labelText: "Player 1 Name",
              hintText: 'Enter Player 1 name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                ),
              ),
            ),
            onTap: () {
              controller.clear();
            },
          ),
          const SizedBox(height: 20),

          // Player 2 Input
          TextFormField(
            controller: controller2,
            style: const TextStyle(fontSize: 18, color: Colors.black),
            decoration: InputDecoration(
              labelText: "Player 2 Name",
              hintText: 'Enter Player 2 name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2.0,
                ),
              ),
            ),
            onTap: () {
              controller2.clear();
            },
          ),
          const SizedBox(height: 40),

          // Start Game Button
          ElevatedButton(
            onPressed: () {
              onPressed([
                (controller.text.isNotEmpty) ? controller.text : "Player 1",
                (controller2.text.isNotEmpty) ? controller2.text : "Player 2"
              ]);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              "Start Game",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

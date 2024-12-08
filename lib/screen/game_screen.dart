// import 'dart:async';
// import 'dart:math';
//
// import 'package:bomb_gamber/model/option_model.dart';
// import 'package:bomb_gamber/screen/widget/tap_option.dart';
// import 'package:flutter/material.dart';
//
// class GameScreen extends StatefulWidget {
//   const GameScreen({super.key,
//   required this.onOptionSelected,
//     required this.player1Name,
//     required this.player2Name,
//   required this.stayAway});
//
//
//   final String player1Name;
//   final String player2Name;
//   final void Function(String) onOptionSelected;
//   final void Function() stayAway;
//
//   @override
//   State<GameScreen> createState() => _GameScreenState();
// }
//
// class _GameScreenState extends State<GameScreen> {
//   final OptionModel obj = OptionModel(option: []);
//   bool optionsRevealed = false;
//   bool player1Turn = true;
//   Timer? _timer;
//   int point=0;
//   int player1Score = 0;
//   int player2Score = 0;
//   int round=0;
//
//   int player1LastScore = 0;
//   int player2LastScore = 0;
//
//
//
//
//   // Function to generate random points
//   int pointGenerate() {
//     return Random().nextInt(100); // Random number between 0 and 99
//   }
//
//
//   void generateOptions() {
//     obj.option.clear(); // Clear previous options
//     for (int i = 0; i < 3; i++) {
//       obj.option.add(pointGenerate()); // Add random points
//     }
//     obj.option.add("boom"); // Add the "boom" option
//     obj.option.shuffle(); // Shuffle the options
//     optionsRevealed = false; // Hide the options initially
//   }
//
//   void handleOptionTap(String option) {
//     setState(() {
//       optionsRevealed = true;
//     });
//     _onOptionSelected(option);
//
//     if (option == "boom") {
//       setState(() {
//         if (player1Turn) {
//           player1LastScore=player1Score;
//           player1Score = 0;
//         }
//         else {
//           player2LastScore=player2Score;
//           player2Score = 0;
//           setState(() {
//             round=1;
//           });
//
//         }
//         player1Turn = !player1Turn; // Switch turns
//       });}
//     else {
//       setState(() {
//         if (player1Turn) {
//           player1Score +=int.parse(option) ;
//         } else {
//           player2Score +=int.parse(option) ;
//         }
//       });
//     }
//   }
//   // Start a timer that regenerates the options every 5 seconds
//   void startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
//       setState(() {
//         generateOptions();
//       });
//     });
//
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     generateOptions(); // Generate initial options
//     startTimer(); // Start the periodic timer
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel(); // Cancel the timer when the widget is disposed
//     super.dispose();
//     round=0;
//   }
//
//   void _onOptionSelected(String answer) {
//     widget.onOptionSelected(answer);
//
//
//     setState(() {});
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child:(round==0)? Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//
//         children: [
//           Row(
//             children: [
//               SizedBox(width: 20,),
//
//       Text(
//         player1Turn ? "${widget.player1Name}'s Turn" : "${widget.player2Name}'s Turn",
//         style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//       ),
//               SizedBox(width: 100,),
//               Text(
//                 player1Turn ? "${player1Score}' points" : "${player2Score}' points",
//                 style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ],
//           ),
//
//           // ...obj.option.map(
//           //       (option) => TapOption(
//           //     text: optionsRevealed ? option.toString() : "Tap", // Show "Tap" if not revealed
//           //     onTap:!optionsRevealed ? () {
//           //
//           //
//           //
//           //       handleOptionTap(option.toString());
//           //     }:(){},
//           //   ),
//           // ),
//
//
//
//           for (int i = 0; i < obj.option.length; i += 2)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.all(10),
//                   child: TapOption(
//                     text: optionsRevealed ? obj.option[i].toString() : "Tap",
//                     onTap: !optionsRevealed
//                         ? () {
//                       handleOptionTap(obj.option[i].toString());
//                     }
//                         : (){}, // Disable tapping if options are revealed
//                   ),
//                 ),
//                 const SizedBox(width: 16,height: 16,), // Space between two TapOptions
//                 if (i + 1 < obj.option.length) // Check to avoid out-of-bound errors
//                   Padding(
//                     padding: EdgeInsets.all(10),
//                     child: TapOption(
//                       text: optionsRevealed ? obj.option[i + 1].toString() : "Tap",
//                       onTap: !optionsRevealed
//                           ? () {
//                         handleOptionTap(obj.option[i + 1].toString());
//                       }
//                           : (){},
//                     ),
//                   ),
//               ],
//             ),
//           const SizedBox(height: 16),
//
//
//
//
//           const SizedBox(height: 20),
//
//           // Reset button
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 generateOptions(); // Reset the game
//               });
//             },
//             child: const Text("Reset Game"),
//           ),
//           ElevatedButton(onPressed: widget.stayAway, child: Text("stay away"))
//         ],
//       ):Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: 100,),
//           const SizedBox(height: 20), // Top padding
//           // Player 1 Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center, // Center-align the row
//             children: [
//               Text(
//                 widget.player1Name,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 30), // Space between name and score
//               Text(
//                 "Score: ${player1LastScore.toString()}",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10), // Space between rows
//
//           // Player 2 Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center, // Center-align the row
//             children: [
//               Text(
//                 widget.player2Name,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(width: 30), // Space between name and score
//               Text(
//                 "Score: ${player2LastScore.toString()}",
//                 style: const TextStyle(
//                   fontSize: 16,
//                   color: Colors.green,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 20), // Space before winner announcement
//
//           // Winner Announcement
//           Text(
//             player1LastScore < player2LastScore
//                 ? "${widget.player2Name} Wins! 🎉"
//                 : "${widget.player1Name} Wins! 🎉",
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.red,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 30), // Space before buttons
//
//           // "Play Again" Button
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 round = 0; // Reset the game
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue, // Button color
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             ),
//             child: const Text(
//               "Play Again",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//           const SizedBox(height: 10), // Space between buttons
//
//           // "Stay Away" Button
//           ElevatedButton(
//             onPressed: widget.stayAway,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red, // Button color
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             ),
//             child: const Text(
//               "Stay Away",
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//         ],
//       )
//
//     );
//   }
// }






























import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:bomb_gamber/model/option_model.dart';
import 'package:bomb_gamber/screen/widget/tap_option.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({
    super.key,
    required this.onOptionSelected,
    required this.player1Name,
    required this.player2Name,
    required this.stayAway,
  });

  final String player1Name;
  final String player2Name;
  final void Function(String) onOptionSelected;
  final void Function() stayAway;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final OptionModel obj = OptionModel(option: []);
  bool optionsRevealed = false;
  bool player1Turn = true;
  Timer? _timer;
  int point = 0;
  int player1Score = 0;
  int player2Score = 0;
  int round = 0;

  int player1LastScore = 0;
  int player2LastScore = 0;

  int pointGenerate() => Random().nextInt(100);

  void generateOptions() {
    obj.option.clear();
    for (int i = 0; i < 3; i++) {
      obj.option.add(pointGenerate());
    }
    obj.option.add("boom");
    obj.option.shuffle();
    optionsRevealed = false;
  }

  void handleOptionTap(String option) {
    setState(() => optionsRevealed = true);
    _onOptionSelected(option);

    if (option == "boom") {
      setState(() {
        if (player1Turn) {
          player1LastScore = player1Score;
          player1Score = 0;
        } else {
          player2LastScore = player2Score;
          player2Score = 0;
          round = 1;
        }
        player1Turn = !player1Turn;
      });
    } else {
      setState(() {
        if (player1Turn) {
          player1Score += int.parse(option);
        } else {
          player2Score += int.parse(option);
        }
      });
    }
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() => generateOptions());
    });
  }

  @override
  void initState() {
    super.initState();
    generateOptions();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    round = 0;
    super.dispose();
  }

  void _onOptionSelected(String answer) {
    widget.onOptionSelected(answer);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (round == 0)
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Turn Indicator and Scores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 20),
              Text(
                player1Turn
                    ? "${widget.player1Name}'s Turn"
                    : "${widget.player2Name}'s Turn",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Add color for emphasis
                ),
              ),

              // Score Display
              Row(
                children: [
                  Text(
                    player1Turn
                        ? "${player1Score} points"
                        : "${player2Score} points",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Score-specific color
                    ),
                  ),
                  const SizedBox(width: 10), // Small padding after score
                  const Icon(
                    Icons.star, // Add a star icon for aesthetic
                    color: Colors.amber,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Options Grid
          for (int i = 0; i < obj.option.length; i += 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TapOption(
                    text: optionsRevealed
                        ? obj.option[i].toString()
                        : "Tap",
                    onTap: !optionsRevealed
                        ? () => handleOptionTap(obj.option[i].toString())
                        : () {},
                  ),
                ),
                const SizedBox(width: 16),
                if (i + 1 < obj.option.length)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TapOption(
                      text: optionsRevealed
                          ? obj.option[i + 1].toString()
                          : "Tap",
                      onTap: !optionsRevealed
                          ? () =>
                          handleOptionTap(obj.option[i + 1].toString())
                          : () {},
                    ),
                  ),
              ],
            ),

          const SizedBox(height: 20),

          // Reset Game Button
          // Play Again Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Play Again Button
              ElevatedButton(
                onPressed: () => setState(() => round = 0),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 5, // Add shadow for depth
                ),
                child: const Text(
                  "Play Again",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Stay Away Button
              ElevatedButton(
                onPressed: widget.stayAway,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 5, // Add shadow for depth
                ),
                child: const Text(
                  "Stay Away",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          // Player 1 Score
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.player1Name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                "Score: ${player1LastScore.toString()}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Player 2 Score
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.player2Name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 30),
              Text(
                "Score: ${player2LastScore.toString()}",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Winner Announcement
          Text(
            (player1LastScore < player2LastScore)
                ? "${widget.player2Name} Wins! 🎉"
                : (player1LastScore > player2LastScore)
                ? "${widget.player1Name} Wins! 🎉"
                : "No one wins! It's a tie 🤝",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 30),

          // Play Again Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Play Again Button
              ElevatedButton(
                onPressed: () => setState(() => round = 0),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 5, // Add shadow for depth
                ),
                child: const Text(
                  "Play Again",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Stay Away Button
              ElevatedButton(
                onPressed: widget.stayAway,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 5, // Add shadow for depth
                ),
                child: const Text(
                  "Stay Away",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )

        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

class quizSelection extends StatelessWidget {
  const quizSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

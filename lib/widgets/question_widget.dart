import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String questionText;
  final int index;
  final int total;

  const QuestionWidget({
    super.key,
    required this.questionText,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pertanyaan ${index + 1} dari $total",
          style: const TextStyle(fontFamily: "NotoSerif", fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          questionText,
          style: const TextStyle(
            fontFamily: "NotoSerif",
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

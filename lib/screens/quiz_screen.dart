import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../widgets/answer_button.dart';
import '../widgets/question_widget.dart';

class QuizScreen extends StatefulWidget {
  final String userName;

  const QuizScreen({super.key, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == sampleQuestions[currentIndex].correctIndex) {
      score++;
    }

    if (currentIndex < sampleQuestions.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: const Color(0xFF3E1E68),
          title: const Text(
            "Kuis Selesai!",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "${widget.userName}, skor kamu adalah $score dari ${sampleQuestions.length}",
            style: const TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text(
                "Kembali ke Menu",
                style: TextStyle(color: Colors.amberAccent),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = sampleQuestions[currentIndex];

    return Scaffold(
      backgroundColor: const Color(0xFF3E1E68), // 💜 Background ungu gelap
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Halo, ${widget.userName}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QuestionWidget(
              questionText: currentQuestion.questionText,
              index: currentIndex,
              total: sampleQuestions.length,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.options.asMap().entries.map((entry) {
              int index = entry.key;
              String text = entry.value;
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white.withOpacity(0.1),
                ),
                child: AnswerButton(
                  text: text,
                  onTap: () => answerQuestion(index),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FeedbackDialog extends StatefulWidget {
  final bool isCorrect;
  final String title;
  final String message;
  final VoidCallback onDismiss;

  const FeedbackDialog({
    required this.isCorrect,
    required this.title,
    required this.message,
    required this.onDismiss,
  });

  @override
  FeedbackDialogState createState() => FeedbackDialogState();
}

class FeedbackDialogState extends State<FeedbackDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:
          widget.isCorrect ? const Color(0xFF4A7B0F) : const Color(0xFF7B0F0F),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: widget.isCorrect
              ? const Color(0xFF84E760)
              : const Color(0xFFFF2103),
          width: 4,
        ),
      ),
      title: Row(
        children: [
          const SizedBox(width: 30),
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: Row(
        children: [
          if (widget.isCorrect)
            ScaleTransition(
              scale: _animation,
              child: const Icon(
                Icons.star,
                color: Color(0xFFFFC700),
                size: 45,
              ),
            ),
          if (!widget.isCorrect)
            SvgPicture.asset(
              'assets/images/atencao2.svg',
              width: 45,
            ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              widget.message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

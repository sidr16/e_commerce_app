import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../constants/app_font_family.dart';
import '../buttons/primary_filled_button.dart';
import '../buttons/secondary_filled_button.dart';

Future<void> showQuestionDialog(
  BuildContext context, {
  required VoidCallback onAccept,
  required String title,
  String? description,
}) async {
  await showDialog<void>(
    context: context,
    builder: (context) {
      return QuestionDialog(
        title: title,
        onAccept: onAccept,
        description: description,
      );
    },
  );
}

class QuestionDialog extends StatelessWidget {
  const QuestionDialog({
    required this.onAccept,
    required this.title,
    this.description,
    super.key,
  });

  final String title;
  final String? description;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                fontFamily: AppFontFamily.akrobat,
              ),
            ),
            const Gap(8),
            if (description != null)
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 280,
                ),
                child: Text(
                  description!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xff94969C),
                  ),
                ),
              ),
            const Gap(12),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: PrimaryFilledButton(
                    title: 'Нет',
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
                Expanded(
                  child: SecondaryFilledButton(
                    title: 'Да',
                    onPressed: () {
                      onAccept();
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

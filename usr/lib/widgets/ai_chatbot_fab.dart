import 'package:flutter/material.dart';

class AiChatbotFab extends StatelessWidget {
  const AiChatbotFab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      onPressed: () {
        // Placeholder for chatbot functionality
      },
      backgroundColor: theme.colorScheme.primary,
      tooltip: 'Assistente FirstCredi.AI',
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withOpacity(0.7),
              blurRadius: 15,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(
          Icons.support_agent,
          color: Colors.white,
        ),
      ),
    );
  }
}

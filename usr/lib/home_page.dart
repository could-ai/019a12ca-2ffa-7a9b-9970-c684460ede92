import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/credit_simulator.dart';
import 'package:couldai_user_app/widgets/ai_chatbot_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FirstCredi.EI',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lock_outline),
            onPressed: () {
              // Placeholder for Back-Office Portal login
            },
            tooltip: 'Portal Interno',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: const CreditSimulator(),
            ),
          ),
        ),
      ),
      floatingActionButton: const AiChatbotFab(),
    );
  }
}

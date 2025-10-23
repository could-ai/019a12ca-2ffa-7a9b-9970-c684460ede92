import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class CreditSimulator extends StatefulWidget {
  const CreditSimulator({super.key});

  @override
  State<CreditSimulator> createState() => _CreditSimulatorState();
}

class _CreditSimulatorState extends State<CreditSimulator> {
  double _loanAmount = 50000;
  double _loanTerm = 24;
  
  // Using an average rate of 22.5% for calculation as per the 20-25% range
  final double _annualRate = 22.5; 

  String _monthlyPayment = '';
  String _totalInterest = '';

  final NumberFormat _currencyFormat = NumberFormat.currency(locale: 'pt_MZ', symbol: 'MZN', decimalDigits: 2);

  @override
  void initState() {
    super.initState();
    _calculateCredit();
  }

  void _calculateCredit() {
    final double monthlyRate = (_annualRate / 100) / 12;
    final double principal = _loanAmount;
    final int numberOfMonths = _loanTerm.toInt();

    if (principal > 0 && numberOfMonths > 0) {
      double monthlyPaymentValue = (principal * monthlyRate * pow(1 + monthlyRate, numberOfMonths)) / (pow(1 + monthlyRate, numberOfMonths) - 1);
      double totalPayment = monthlyPaymentValue * numberOfMonths;
      double totalInterestValue = totalPayment - principal;

      setState(() {
        _monthlyPayment = _currencyFormat.format(monthlyPaymentValue);
        _totalInterest = _currencyFormat.format(totalInterestValue);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Simulador de Crédito Interativo',
            style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildSliderRow(
            label: 'Valor do Empréstimo',
            value: _loanAmount,
            displayValue: _currencyFormat.format(_loanAmount),
            min: 1000,
            max: 500000,
            divisions: 499,
            onChanged: (value) {
              setState(() {
                _loanAmount = value;
              });
              _calculateCredit();
            },
          ),
          const SizedBox(height: 24),
          _buildSliderRow(
            label: 'Prazo (Meses)',
            value: _loanTerm,
            displayValue: '${_loanTerm.toInt()} meses',
            min: 6,
            max: 60,
            divisions: 54,
            onChanged: (value) {
              setState(() {
                _loanTerm = value;
              });
              _calculateCredit();
            },
          ),
          const SizedBox(height: 32),
          _buildResultsSection(),
          const SizedBox(height: 24),
          Text(
            'Nota: A simulação é baseada numa taxa de juro (TAEG) entre 20% e 25%, conforme as normas do Banco de Moçambique. O valor final pode variar.',
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey[400]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderRow({
    required String label,
    required double value,
    required String displayValue,
    required double min,
    required double max,
    required int divisions,
    required ValueChanged<double> onChanged,
  }) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: theme.textTheme.titleMedium),
            Text(
              displayValue,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: divisions,
          label: value.round().toString(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildResultsSection() {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildResultItem('Pagamento Mensal', _monthlyPayment),
          _buildResultItem('Juros Totais', _totalInterest),
        ],
      ),
    );
  }

  Widget _buildResultItem(String title, String value) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

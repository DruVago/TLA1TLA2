import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator/model/calculator.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Calculator',
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calculator = ref.watch(calculatorProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              calculator.expression,
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(ref, '7'),
              _buildButton(ref, '8'),
              _buildButton(ref, '9'),
              _buildButton(ref, '÷'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(ref, '4'),
              _buildButton(ref, '5'),
              _buildButton(ref, '6'),
              _buildButton(ref, 'x'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(ref, '1'),
              _buildButton(ref, '2'),
              _buildButton(ref, '3'),
              _buildButton(ref, '-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(ref, '0'),
              _buildButton(ref, '.'),
              _buildButton(ref, '='),
              _buildButton(ref, '+'),
            ],
          ),
          ElevatedButton(
            onPressed: () => ref.read(calculatorProvider).clear(),
            child: Text('C', style: TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(WidgetRef ref, String value) {
    return ElevatedButton(
      onPressed: () {
        final calculator = ref.read(calculatorProvider);
        if (value == '=') {
          calculator.calculate();
        } else {
          calculator.append(value);
        }
      },
      child: Text(value, style: TextStyle(fontSize: 24)),
    );
  }
}

import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget{
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() =>
  _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final firstNumberController = TextEditingController();
  final secondNumberController = TextEditingController();

  String result = '0';
  String operationLabel = 'Enter two numbers';

  
  void calculate(String operation){
    final first = double.tryParse(firstNumberController.text.trim());
    final second = double.tryParse(secondNumberController.text.trim());

    if (first == null || second == null || !first.isFinite || !second.isFinite){
      setState((){
        result = 'Invalid input';
        operationLabel = 'Please enter two valid number';
        });
        return;
      }

    if (operation == '÷' && second == 0){
      setState(() {
        result = 'Cannot divide by zero';
        operationLabel = 'Please change the second number';
        });
        return;
      }

    double answer;

    switch (operation){
      case '+':
        answer = first + second;
        break;
      case '-':
        answer = first - second;
        break;
       case '×':
        answer = first * second;
        break;
      case '÷':
        answer = first/second;
        break;
      default:
        return; 
    }

    setState(() {
      result = answer.toString();
      operationLabel = '$first $operation $second';
    });
  }

  void clearCalculator() {
    firstNumberController.clear();
    secondNumberController.clear();

    setState(() {
      result = '0';
      operationLabel = 'Enter two numbers';
    });
  }

  @override
  void dispose(){
    firstNumberController.dispose();
    secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Stateful Calculator'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 112, 33, 60),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1, 
          vertical: MediaQuery.sizeOf(context).height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.calculate,
              size: 64,
              color: Color.fromARGB(255, 112, 33, 60),
            ),
            const SizedBox(height: 12),
  
            const Text(
              'BASIC CALCULATOR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
  
            TextField(
              controller: firstNumberController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'First Number',
                hintText: 'Enter the first number',
                prefixIcon: Icon(Icons.looks_one, color:Color.fromARGB(255, 112, 33, 60),),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
  
            TextField(
              controller: secondNumberController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: true,
              ),
              decoration: const InputDecoration(
                labelText: 'Second Number',
                hintText: 'Enter the second number',
                prefixIcon: Icon(Icons.looks_two, color: Color.fromARGB(255, 112, 33, 60)),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
  
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 112, 33, 60)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: const Text(
                    '−',
                    style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 112, 33, 60)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculate('x'),
                  child: const Text(
                    '×',
                    style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 112, 33, 60)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => calculate('÷'),
                  child: const Text(
                    '÷',
                    style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 112, 33, 60)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
  
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Color.fromARGB(41, 112, 33, 61),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color.fromARGB(255, 112, 33, 60)),
              ),
              child: Column(
                children: [
                  Text(
                    operationLabel,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'RESULT',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 112, 33, 60),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
  
            OutlinedButton.icon(
              onPressed: clearCalculator,
              icon: const Icon(Icons.refresh, color: Color.fromARGB(255, 112, 33, 60)),
              label: const Text('Clear', style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 112, 33, 60),),)
            ),
            const SizedBox(height: 70),
  
            const Text(
              'Copied by: Germaine Joy C. Incinada\nSection: CCE 106 (3450)',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double imc;

  const ResultScreen({super.key, required this.imc});

  String _getClassificacao() {
    if (imc < 18.5) {
      return 'Magreza';
    } else if (imc < 24.9) {
      return 'Normal';
    } else if (imc < 29.9) {
      return 'Sobrepeso - Obesidade Grau 1';
    } else if (imc < 39.9) {
      return 'Obesidade - Obesidade Grau 2';
    } else {
      return 'Obesidade Grave - Obesidade Grau 3';
    }
  }

  Color _getCorClassificacao() {
    if (imc < 18.5) {
      return Colors.orange;
    } else if (imc < 24.9) {
      return Colors.green;
    } else if (imc < 29.9) {
      return Colors.yellow.shade800;
    } else {
      return Colors.red;
    }
  }

  IconData _getIconeClassificacao() {
    if (imc < 18.5) {
      return Icons.warning_amber;
    } else if (imc < 24.9) {
      return Icons.check_circle;
    } else if (imc < 29.9) {
      return Icons.warning;
    } else {
      return Icons.dangerous;
    }
  }

  String _getMensagem() {
    if (imc < 18.5) {
      return 'Você está abaixo do peso ideal. Procure um nutricionista para orientação.';
    } else if (imc < 24.9) {
      return 'Parabéns! Seu peso está dentro da faixa considerada saudável.';
    } else if (imc < 29.9) {
      return 'Atenção! Você está com sobrepeso. Considere adotar hábitos mais saudáveis.';
    } else {
      return 'Atenção! Você está com obesidade. Procure ajuda profissional para cuidar da sua saúde.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final classificacao = _getClassificacao();
    final cor = _getCorClassificacao();
    final icone = _getIconeClassificacao();
    final mensagem = _getMensagem();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do IMC'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, size: 80, color: cor),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: cor, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Seu IMC é',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    imc.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: cor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    classificacao,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: cor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              mensagem,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'CALCULAR NOVAMENTE',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

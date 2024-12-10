import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final double height;
  final Color selectedColor;
  final Color unselectedColor;

  const CustomProgressBar({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
    this.height = 34, // Define a altura fina
    this.selectedColor = const Color(0xFFE5F90E),
    this.unselectedColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 1), // Espaçamento entre barras
          child: Container(
            width: 6, // Largura de cada barrinha
            height: height,
            decoration: BoxDecoration(
              color: index < currentStep ? selectedColor : unselectedColor,
              borderRadius: BorderRadius.circular(3), // Bordas arredondadas
            ),
          ),
        );
      }),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentStep;
  final int totalSteps;
  final int stars;

  const CustomAppBar({
    Key? key,
    required this.currentStep,
    required this.totalSteps,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFCC80),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange,
                child: const Icon(Icons.settings, color: Colors.white),
              ),
              const SizedBox(width: 8),
              CustomProgressBar(
                totalSteps: totalSteps,
                currentStep: currentStep,
                height: 4, // Altura fina
                selectedColor: Colors.purple,
                unselectedColor: Colors.white,
              ),
              const SizedBox(width: 8),
              const Text(
                "Missão Segurança",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5D3C0A),
                ),
              ),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.pink,
                child: const Icon(Icons.star, color: Colors.white),
              ),
              const SizedBox(width: 4),
              Text(
                "$stars",
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Altura da AppBar
}

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      appBar: CustomAppBar(
        currentStep: 3,
        totalSteps: 5,
        stars: 2,
      ),
      body: Center(child: Text('Exemplo de barra de progresso customizada')),
    ),
  ));
}

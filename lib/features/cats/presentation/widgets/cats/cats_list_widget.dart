import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/core/utils/custom_arguments.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/custom_colors.dart';
import '../../../../core/utils/custom_navigator.dart';// Asegúrate de importar el modelo correcto

class CatsList extends StatelessWidget {
  final List<Cat> catsList;

  const CatsList({super.key, required this.catsList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: catsList.length,
        itemBuilder: (context, index) {
          final cat = catsList[index];
          return GestureDetector(
            onTap: () => _goToDetails(context, cat),
            child: Card(
              color: CustomColors.lightGray,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
                side: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cat.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Más...',
                              style: TextStyle(color: CustomColors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    cat.imageUrl ?? '',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Center(child: const Icon(Icons.error)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Pais de origen: ${cat.origin ?? "Desconocido"}'),
                        Text('Inteligencia: ${cat.intelligence ?? "Desconocido"}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _goToDetails(BuildContext context, Cat cat) {
    Navigator.of(context).pushNamed(CustomRoutes.catsDetails, arguments: CatDetailsArguments(cat: cat));
  }
}

import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:flutter/material.dart';

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
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10.0),
              leading: Image.network(
                cat.imageUrl ?? '',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    cat.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Text('Más...', style: TextStyle(color: Colors.blue)),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pais de origen: ${cat.origin ?? "Desconocido"}'),
                  Text('Inteligencia: ${cat.intelligence ?? "Desconocido"}'),
                ],
              ),
              onTap: () {
                _goToDetails(context);
              },
            ),
          );
        },
      ),
    );
  }

  void _goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(CustomRoutes.catsDetails);
  }
}

import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:cats_app/features/core/utils/custom_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/cats/cat_attribute_info_widget.dart';

class CatDetailsPage extends StatelessWidget {
  final Cat cat;

  const CatDetailsPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: CustomColors.lightGray,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(
              cat.imageUrl ?? 'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatAttributeInfoWidget(
                      title: 'Descripción:',
                      content: cat.description ?? 'No description available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'Temperamento:',
                      content:
                          cat.temperament ?? 'No temperament info available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'País de Origen:',
                      content: cat.origin ?? 'No origin info available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'Vida útil:',
                      content: cat.lifeSpan ?? 'No life span info available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'Adaptabilidad:',
                      content: cat.adaptability?.toString() ??
                          'No adaptability info available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'Nivel de afecto:',
                      content: cat.affectionLevel?.toString() ??
                          'No affection level info available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'Inteligencia:',
                      content: cat.intelligence?.toString() ??
                          'No intelligence info available.',
                    ),
                    CatAttributeInfoWidget(
                      title: 'Vocalización:',
                      content: cat.vocalisation?.toString() ??
                          'No vocalisation info available.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

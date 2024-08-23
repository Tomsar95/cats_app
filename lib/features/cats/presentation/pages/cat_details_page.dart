import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:flutter/material.dart';

import '../widgets/cats/cat_attribute_info_widget.dart';

 // Asegúrate de importar tu modelo Cat aquí

class CatDetailsPage extends StatelessWidget {
  final Cat cat;

  const CatDetailsPage({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(cat.name),
              background: Image.network(
                cat.imageUrl ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CatAttributeInfoWidget(
                        title: 'Descripción:',
                        content: cat.description ?? 'No description available.',),
                      CatAttributeInfoWidget(
                        title: 'Temperamento:',
                        content: cat.temperament ?? 'No temperament info available.',
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
                        content: cat.adaptability?.toString() ?? 'No adaptability info available.',
                      ),
                      CatAttributeInfoWidget(
                        title: 'Nivel de afecto:',
                        content: cat.affectionLevel?.toString() ?? 'No affection level info available.',
                      ),
                      CatAttributeInfoWidget(
                        title: 'Inteligencia:',
                        content: cat.intelligence?.toString() ?? 'No intelligence info available.',
                      ),
                      CatAttributeInfoWidget(
                        title: 'Vocalización:',
                        content: cat.vocalisation?.toString() ?? 'No vocalisation info available.',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

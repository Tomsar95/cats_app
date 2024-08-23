import 'package:cats_app/features/cats/domain/entities/cat.dart';
import 'package:flutter/material.dart';

class CatDetailsPage extends StatefulWidget {

  const CatDetailsPage({super.key, required this.cat});

  final Cat cat;

  @override
  State<CatDetailsPage> createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

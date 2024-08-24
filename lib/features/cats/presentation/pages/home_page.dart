import 'package:cats_app/features/cats/presentation/widgets/cats/cats_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../core/utils/custom_colors.dart';
import '../../domain/entities/cat.dart';
import '../blocs/cats_bloc/cats_bloc.dart';
import '../widgets/general/loading_widget.dart';
import '../widgets/general/message_display.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<CatsBloc>(),
      child: BlocBuilder<CatsBloc, CatsState>(
        builder: (context, state) {
          if (state is CatsInitial) {
            context.read<CatsBloc>().add(GetCatsEvent());
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: loading(),
            );
          } else if (state is LoadedCatsState) {
            return buildContent(state.listOfCats, context);
          } else if (state is ErrorState) {
            return MessageDisplay(
              message: state.message,
              onRetry: () {
                context.read<CatsBloc>().add(GetCatsEvent());
              },
            );
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: const Placeholder(),
          );
        },
      ),
    );
  }

  Widget buildContent(List<Cat> cats, BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGray,
      appBar: AppBar(
        title: const Text('Catbreeds'),
        backgroundColor: CustomColors.lightGray,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                context.read<CatsBloc>().add(SearchCatsEvent(value));
              },
            ),
          ),
          CatsList(catsList: cats),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_solution/presenter/controllers/home/home_state.dart';
import 'package:test_solution/presenter/controllers/home/home_store.dart';
import 'package:test_solution/presenter/widgets/disciplines_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    homeStore = context.read<HomeStore>();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      homeStore.fetchDisciplines();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solução - Teste Mobile'),
        actions: [
          IconButton(
            onPressed: () => homeStore.changeSortType(),
            icon: const Icon(Icons.sort_rounded),
          )
        ],
      ),
      body: ValueListenableBuilder<HomeState>(
        valueListenable: homeStore,
        builder: (_, state, __) {
          if (state is LoadingHomeState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ErrorHomeState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(fontSize: 24.0),
              ),
            );
          }

          if (state is NoDataHomeState) {
            return const Center(
              child: Text(
                'No Data Found',
                style: TextStyle(fontSize: 24.0),
              ),
            );
          }

          if (state is SuccessHomeState) {
            return ListView.builder(
              itemCount: state.disciplinesList.length,
              itemBuilder: (context, index) {
                var discipline = state.disciplinesList[index];
                return DisciplinesListItem(
                  discipline,
                  homeStore.deleteDiscipline,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

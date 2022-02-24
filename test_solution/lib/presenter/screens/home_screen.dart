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
  late final HomeStore _homeStore;

  @override
  void initState() {
    super.initState();
    _homeStore = context.read<HomeStore>();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _homeStore.fetchDisciplines();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solução - Teste Mobile'),
        actions: [
          IconButton(
              onPressed: () => _homeStore.changeSortType(),
              icon: const Icon(Icons.sort_rounded))
        ],
      ),
      body: ValueListenableBuilder<HomeState>(
          valueListenable: _homeStore,
          builder: (context, state, child) {
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
              ));
            }

            if (state is SuccessHomeState) {
              return ListView.builder(
                itemCount: state.disciplinesList.length,
                itemBuilder: (context, index) {
                  var classItem = state.disciplinesList[index];
                  return DisciplinesListItem(
                      classItem, _homeStore.deleteDiscipline);
                },
              );
            }
            return const SizedBox();
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:test_solution/data/datasources/local/classes_local_datasource.dart';
import 'package:test_solution/data/repositories/local/classes_local_repository.dart';
import 'package:test_solution/presenter/controllers/home/home_state.dart';
import 'package:test_solution/presenter/controllers/home/home_store.dart';
import 'package:test_solution/presenter/widgets/classes_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var classMockup = const ClassModel(
  //     companyId: "114",
  //     createdAt: 1571323199864,
  //     name: "Aula Álgebra",
  //     id: "114_0v62DokeArxPA9oDSBst_349785",
  //     status: "IN_PROGRESS",
  //     summary: {"percentage": 20});

  late HomeStore homeStore;

  @override
  void initState() {
    super.initState();
    var datasource = ClassesLocalDatasource("assets/data/classes.json");
    var repository = ClassesLocalRepository(datasource);
    homeStore = HomeStore(repository);
    homeStore.fetchClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solução - Teste Mobile'),
      ),
      body: ValueListenableBuilder<HomeState>(
          valueListenable: homeStore,
          builder: (context, state, child) {
            if (state is LoadingHomeState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is ErrorHomeState) {
              return Center(child: Text(state.message));
            }
            if (state is SuccessHomeState) {
              return ListView.builder(
                itemCount: state.classesList.length,
                itemBuilder: (context, index) {
                  var classItem = state.classesList[index];
                  return ClassesListItem(classItem, index);
                },
              );
            }

            return const SizedBox();
          }),
    );
  }
}

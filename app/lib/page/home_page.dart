import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_mobile/model/class_item_model.dart';

import '../cubit/class_list_cubit.dart';
import '../cubit/class_list_state.dart';
import '../widget/class_item_widget.dart';
import '../widget/loading_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super(key: const Key('HomePage'));

  static const Key genericErrorKey = Key('genericErrorKey');

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ClassListCubit get cubit => context.read<ClassListCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: BlocConsumer<ClassListCubit, ClassListState>(
        builder: builder,
        listener: listener,
      ),
    );
  }

  void listener(BuildContext context, ClassListState state) {
    if (state.action == ClassListAction.deleted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Aula excluída!')),
      );
    }
  }

  Widget builder(BuildContext context, ClassListState state) {
    if (state.isLoading) {
      return const LoadingWidget();
    } else if (state.error == ClassListError.generic) {
      return makeErrorWidget();
    }

    return makeBody(state);
  }

  Widget makeBody(ClassListState state) => SafeArea(
        child: CustomScrollView(
          slivers: [
            makePageTitle(),
            makeList(state.classes),
          ],
        ),
      );

  Widget makePageTitle() => const SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 20,
            ),
            child: Text(
              'Aulas',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget makeList(ClassList classes) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final currentModel = classes[index];
            if (currentModel != null &&
                currentModel.status != ClassStatus.deleted) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClassItemWidget(
                  classModel: currentModel,
                  onDelete: (String id) {
                    cubit.deleteItem(id: id);
                  },
                ),
              );
            } else {
              return const SizedBox();
            }
          },
          childCount: classes.length,
        ),
      );

  Widget makeErrorWidget() => Center(
        child: ElevatedButton(
          key: HomePage.genericErrorKey,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () => cubit.loadList(),
          child: const Text(
            'Tentar novamente?',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
}

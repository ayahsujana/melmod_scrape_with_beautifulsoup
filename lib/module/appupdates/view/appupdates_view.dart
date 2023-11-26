
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/appupdates_controller.dart';
import '../state/appupdates_state.dart';
import 'package:get_it/get_it.dart';

class AppupdatesView extends StatefulWidget {
  const AppupdatesView({Key? key}) : super(key: key);

  @override
  State<AppupdatesView> createState() => _AppupdatesViewState();
}

class _AppupdatesViewState extends State<AppupdatesView> {
  AppupdatesController controller = AppupdatesController();

  @override
  void initState() {
    if (GetIt.I.isRegistered<AppupdatesController>()) {
      GetIt.I.unregister<AppupdatesController>();
    }
    GetIt.I.registerSingleton(controller);
    controller.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => controller.ready(),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => controller,
      child: BlocListener<AppupdatesController, AppupdatesState>(
        listener: (context, state) {},
        child: BlocBuilder<AppupdatesController, AppupdatesState>(
          builder: (context, state) {
            final bloc = context.read<AppupdatesController>();
            return buildView(context, bloc, state);
          },
        ),
      ),
    );
  }

  Widget buildView(
    BuildContext context,
    AppupdatesController controller,
    AppupdatesState state,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appupdates'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Counter: ${state.counter}',
            style: const TextStyle(fontSize: 24),
          ),
          IconButton(
            onPressed: () => controller.increment(),
            icon: const Icon(
              Icons.add,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
    
    
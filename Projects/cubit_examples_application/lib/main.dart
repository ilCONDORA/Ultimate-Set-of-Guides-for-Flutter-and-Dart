import 'dart:async';

import 'package:cubit_examples_application/cubit/spinning_circle/spinning_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DoThingButton(),
            ],
          ),
        ),
      ),
    );
  }
}

/// A button that will start and stop the spinning circle.
class DoThingButton extends StatelessWidget {
  const DoThingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      /// SpinningCircleCubit manages the state of the spinning circle.
      create: (context) => SpinningCircleCubit(),
      child: BlocBuilder<SpinningCircleCubit, SpinningCircleState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  /// Create a reference to the SpinningCircleCubit so that the context can be accessed easily.
                  final spinningCircleCubit =
                      context.read<SpinningCircleCubit>();

                  /// Invoke the startSpinning method, which will emit the SpinningCircleSpinning state.
                  spinningCircleCubit.startSpinning();

                  /// Create a task that will complete after 5 seconds.
                  /// It's important to use await here to ensure that the task completes before the stopSpinning method is invoked.
                  /// Without await, the stopSpinning method will be invoked before the task completes.
                  await Future.delayed(const Duration(seconds: 5), () {
                    print('Finished task that took 5 seconds to do');
                  });

                  /// Invoke the stopSpinning method, which will emit the SpinningCircleStopped state.
                  spinningCircleCubit.stopSpinning();
                },
                child:
                    const Text('Do a thing that takes 5 seconds to complete'),
              ),
              const SizedBox(width: 14),
              SizedBox(
                width: 24,
                height: 24,
                child: Visibility(
                  /// Only show the loading indicator if the state is SpinningCircleSpinning.
                  visible: state is SpinningCircleSpinning,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2.5,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

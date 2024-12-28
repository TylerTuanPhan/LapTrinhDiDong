import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bước 3: Định nghĩa Events
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}
class DecrementEvent extends CounterEvent {}
class ResetEvent extends CounterEvent {}

// Bước 4: Định nghĩa States
class CounterState {
  final int count;

  const CounterState(this.count);
}

// Bước 5: Implement CounterBloc
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    // Định nghĩa event handlers
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.count + 1));
    });

    on<DecrementEvent>((event, emit) {
      if (state.count > 0) {
        emit(CounterState(state.count - 1));
      }
    });

    on<ResetEvent>((event, emit) {
      emit(const CounterState(0));
    });
  }
}

/*
// Bước 6: Cập nhật Main App
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App with BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Wrap với BlocProvider
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const CounterScreen(),
      ),
    );
  }
}
*/
// Bước 7: Implement UI với BlocBuilder
class CounterScreen2 extends StatelessWidget {
  const CounterScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App with BLoC'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Dispatch event to bloc
              context.read<CounterBloc>().add(ResetEvent());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current Count:',
              style: TextStyle(fontSize: 20),
            ),
            // BlocBuilder để lắng nghe state changes
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
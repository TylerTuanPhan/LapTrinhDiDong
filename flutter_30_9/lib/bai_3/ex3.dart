import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier{
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter(){
    _counter++;
    notifyListeners();
  }

  void decrementCounter(){
    _counter--;
    notifyListeners();
  }

  void resetCounter(){
    _counter = 0;
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(onPressed: Provider.of<CounterProvider>(context, listen: false).resetCounter,
              icon: const Icon(Icons.refresh)) // Nut nam tren ham appbar
        ],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current Count: ',
              style: TextStyle(fontSize: 20),),
            Text('$_counter',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: Provider.of<CounterProvider>(context, listen: false).decrementCounter,
                    child: const Icon(Icons.remove)),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: Provider.of<CounterProvider>(context, listen: false).incrementCounter,
                    child: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/color_block.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Test BLoC App',
      home: BlocProvider(
        create: (context) => ColorBloc(),
        child: const MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
const MyHomePage({ super.key });

  @override
  Widget build(BuildContext context){
    ColorBloc _bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('a Boy or a Girl'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: const Duration(microseconds: 500),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _bloc.add(PinkColorEvent());
            },
            backgroundColor: Colors.pink.shade200,
          ),
          const SizedBox(width: 20,),
          FloatingActionButton(
            onPressed: () {
              _bloc.add(BlueColorEvent());
            },
            backgroundColor: Colors.blue.shade200,
          ),
        ],
      ),
    );
  }
}
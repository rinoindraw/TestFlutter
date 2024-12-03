import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './blocs/sequence_bloc.dart';
import './blocs/sequence_event.dart';
import './blocs/sequence_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deret Angka',
      home: BlocProvider(
        create: (context) => SequenceBloc(),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Deret Angka'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input Section
            Text('Input N:'),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan nilai N',
              ),
            ),
            SizedBox(height: 16),

            // Button Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    int n = int.tryParse(controller.text) ?? 0;
                    context.read<SequenceBloc>().add(GenerateSequence1(n));
                  },
                  child: Text('Soal 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int n = int.tryParse(controller.text) ?? 0;
                    context.read<SequenceBloc>().add(GenerateSequence2(n));
                  },
                  child: Text('Soal 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int n = int.tryParse(controller.text) ?? 0;
                    context.read<SequenceBloc>().add(GenerateSequence3(n));
                  },
                  child: Text('Soal 3'),
                ),
                ElevatedButton(
                  onPressed: () {
                    int n = int.tryParse(controller.text) ?? 0;
                    context.read<SequenceBloc>().add(GenerateSequence4(n));
                  },
                  child: Text('Soal 4'),
                ),
              ],
            ),

            SizedBox(height: 16),

            // Result Section
            BlocBuilder<SequenceBloc, SequenceState>(
              builder: (context, state) {
                if (state is SequenceGenerated) {
                  return Text('Result: ${state.result}');
                }
                return Text('Result: -');
              },
            ),
          ],
        ),
      ),
    );
  }
}

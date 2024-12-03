import 'package:flutter_bloc/flutter_bloc.dart';
import './sequence_event.dart';
import './sequence_state.dart';

class SequenceBloc extends Bloc<SequenceEvent, SequenceState> {
  SequenceBloc() : super(SequenceInitial()) {
    on<GenerateSequence1>(_onGenerateSequence1);
    on<GenerateSequence2>(_onGenerateSequence2);
    on<GenerateSequence3>(_onGenerateSequence3);
    on<GenerateSequence4>(_onGenerateSequence4);
  }

  void _onGenerateSequence1(GenerateSequence1 event, Emitter<SequenceState> emit) {
    List<int> sequence = List.generate(event.n, (index) => index + 1);
    emit(SequenceGenerated(sequence.join(' ')));
  }

  void _onGenerateSequence2(GenerateSequence2 event, Emitter<SequenceState> emit) {
    List<int> sequence = List.generate(event.n, (index) => index + 1);
    sequence.addAll(List.generate(event.n - 1, (index) => event.n - index - 1));
    emit(SequenceGenerated(sequence.join(' ')));
  }

  void _onGenerateSequence3(GenerateSequence3 event, Emitter<SequenceState> emit) {
    List<String> sequence = [];

    for (int i = 1; i <= event.n; i++) {
      sequence.add('${i * 10 + (i - 1)}');
    }

    emit(SequenceGenerated(sequence.join(' ')));
  }

  void _onGenerateSequence4(GenerateSequence4 event, Emitter<SequenceState> emit) {
    List<String> sequence = [];
    for (int i = 1; i <= event.n; i++) {
      if (i % 5 == 0) {
        sequence.add('LIMA');
      } else if (i % 7 == 0) {
        sequence.add('TUJUH');
      } else {
        sequence.add(i.toString());
      }
    }
    emit(SequenceGenerated(sequence.join(' ')));
  }
}

abstract class SequenceState {}

class SequenceInitial extends SequenceState {}

class SequenceGenerated extends SequenceState {
  final String result;
  SequenceGenerated(this.result);
}

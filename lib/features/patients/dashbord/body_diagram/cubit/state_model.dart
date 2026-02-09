class ModelState {
  final String? lastTappedPart;
  final List<String> tappedParts;

  ModelState({
    this.lastTappedPart,
    required this.tappedParts,
  });

  factory ModelState.initial() {
    return ModelState(
      lastTappedPart: null,
      tappedParts: [],
    );
  }

  ModelState copyWith({
    String? lastTappedPart,
    List<String>? tappedParts,
  }) {
    return ModelState(
      lastTappedPart: lastTappedPart ?? this.lastTappedPart,
      tappedParts: tappedParts ?? this.tappedParts,
    );
  }
}

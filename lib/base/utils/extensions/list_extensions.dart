// Iterable Extensions
extension IterableExtensions<T> on Iterable<T>? {

  /// Remove duplicate elements from the list.
  List<T> removeDuplicates() {
    if (this == null) {
      return <T>[];
    } else {
      return this!.toSet().toList();
    }
  }

  /// Validate given List is not null and returns blank list if null.
  /// This should not be used to clear list
  List<T> validate() {
    if (this == null) {
      return [];
    } else {
      return this!.toList();
    }
  }

  /// Generate forEach but gives index for each element
  void forEachIndexed(void Function(T element, int index) action) {
    var index = 0;
    for (var element in this!) {
      action(element!, index++);
    }
  }

  /// Example:
  /// ```dart
  /// [1, 3, 7].sumBy((n) => n);                 // 11
  /// ['hello', 'world'].sumBy((s) => s.length); // 10
  /// ```
  int sumBy(int Function(T) selector) {
    return this.validate().map(selector).fold(0, (prev, curr) => prev + curr);
  }

  /// Example:
  /// ```dart
  /// [1.5, 2.5].sumByDouble((d) => 0.5 * d); // 2.0
  /// ```
  double sumByDouble(num Function(T) selector) {
    return this.validate().map(selector).fold(0.0, (prev, curr) => prev + curr);
  }

  /// Example:
  /// ```dart
  /// [1, 2, 3].averageBy((n) => n);               // 2.0
  /// ['cat', 'horse'].averageBy((s) => s.length); // 4.0
  /// ```
  double? averageBy(num Function(T) selector) {
    if (this.validate().isEmpty) {
      return null;
    }

    return sumByDouble(selector) / this!.length;
  }
}


extension ListExtensions<T> on List<T>? {
  List<M> transformMapToList<int,M>(Function(int index, T value) convert ) {
    if(this == null){
      return <M>[];
    }
    Iterable<M> iterable = this!.asMap().map(
            (index, value) => MapEntry<int, M>(index as int,convert(index as int,value))).values;
    return iterable.toList();
  }
}
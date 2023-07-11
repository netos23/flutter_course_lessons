void main() {
  power(10);

  final p = asyncPower(10);
  final sub = p.listen((event) {
      print(event);
  });


  // sub.cancel();
}

Iterable<int> power(int n) sync* {
  for (int i = 0; i < n; i++) {
    yield i * i;
  }
}

Stream<int> asyncPower(int n) async* {
  for (int i = 0; i < n; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i * i;
    await Future.delayed(Duration(milliseconds: 300));
    yield i * i;
    await Future.delayed(Duration(milliseconds: 300));
    yield (i-1) * (i-1);
  }
}

Iterable<int> powerList(int n) {
  final list = <int>[];
  for (int i = 0; i < n; i++) {
    list.add(i * i);
  }
  return list;
}

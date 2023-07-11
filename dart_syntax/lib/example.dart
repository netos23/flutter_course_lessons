import 'dart:collection';

import 'package:dart_syntax/text1.dart';

typedef Fun = void Function(int);

void main() {
  final list = [1,2,4];

  print?.aaa(list.where((element) => element > 10).firstOrNull ?? 10);
}

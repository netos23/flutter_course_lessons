import 'dart:async';

Future<void> main(List<String> arguments) async {
  Future(() async{
    await Future.delayed(Duration(seconds: 1));
    print('future from ');
  });
  Future.microtask(() async{
    await Future.delayed(Duration(seconds: 1));
    print('microtask from ');
  }).onError((error, stackTrace) => null);


  // unawaited(log('aa'));
  // print('Hello world: ');
}

Future<void> log(String text) async {
  await Future.delayed(Duration(microseconds: 1));
  throw Exception('eee');
  print(text);
}

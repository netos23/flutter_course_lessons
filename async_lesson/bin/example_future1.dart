Future<void> main() async {
  methodA();
  await methodB();
  await methodC('main');
  methodD();
}

void methodA() {
  print('A');
}

Future<void> methodB() async {
  print('B start');
  await methodC('B');
  print('B end');
}

Future<void> methodC(String from) async {
  print('C start from $from');

  Future(() {
    print('C running Future from $from');
  }).then((_) {
    print('C end of Future from $from');
  });

  Future.microtask(() async{
    await Future.delayed(Duration(hours: ));
    print('microtask from $from');
  });

  print('C end from $from');
}

void methodD() {
  print('D');
}

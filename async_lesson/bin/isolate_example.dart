import 'dart:async';
import 'dart:isolate';

void main() => Future<void>(() async {
  final rcvPort = ReceivePort(); // ReceivePort for the main isolate.
  final isolate = await Isolate.spawn<SendPort>(
    entryPoint,
    rcvPort.sendPort,
    errorsAreFatal: true,
    debugName: 'MyIsolate',
  );
  final completer = Completer<SendPort>(); // For awaiting the SendPort.
  rcvPort.listen((message) {
    if (message is SendPort) completer.complete(message);
    if (message is String) print(message);
  });
  final send2Isolate = await completer.future; // Get the SendPort.
  send2Isolate.send(7); // Send a message to the spawned isolate.
  await Future<void>.delayed(const Duration(seconds: 1));
  rcvPort.close(); // Close the ReceivePort.
  isolate.kill(); // Kill the isolate.
});

void entryPoint(SendPort send2main) {
  final rcvPort = ReceivePort(); // ReceivePort for the spawned isolate.
  send2main.send(rcvPort.sendPort); // Send the SendPort to the main isolate.
  // Listen to the ReceivePort and calculate the factorial.
  rcvPort.listen((message) {
    if (message is! int) return; // Ignore messages of other types.
    for (var i = 1, r = 1; i <= message; i++, r *= i) {
      // Send a message to the main isolate.
      send2main.send('$i! = $r');
    }
  });
}
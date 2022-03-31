//How async work

Future<int> cube(int num) {
  return Future.value(num * num * num);
}

asyncTask() {
  print("I am the first line");
  Future.delayed(Duration(seconds: 5), () {
    print("I will call after 5 seconds");
    Future.delayed(Duration(seconds: 4), () {
      print("i will call after 4 seconds");
      Future.delayed(Duration(seconds: 3), () {
        print("i will call after 3 seconds");
        Future.delayed(Duration(seconds: 2), () {
          print("i will call after 2 seconds");
          Future.delayed(Duration(seconds: 1), () {
            print("i will call after 1 seconds");
          });
        });
      });
    });
  });
  // Future.delayed(Duration(seconds: 2),  int one() { //async function can't be named
  //   return 100;
  // });

  // int one_func = one();
  // while (true) {
  //   print("i am running");
  // }
  print("I am the last line");
}

void main() {
  //asyncTask();
  print("i am first");
  Future<int> future = cube(3);
  future.then((value) => print(value)).catchError((err) => print(err));
  print("i am last");
}

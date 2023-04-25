import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const Screen1(),
    // route exmaple
    routes: <String, WidgetBuilder>{
      '/screen1': (BuildContext context) => const Screen1(),
      '/screen2': (BuildContext context) => const Screen2(),
      '/screen3': (BuildContext context) => const Screen3(),
      '/screen4': (BuildContext context) => const Screen4()
    },
  ));
}

// pushNamed() example
// canPop() example
// maybePop() example
// pop() example
class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Screen1");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 1"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen2');
              },
              child: const Text("Push to Screen 2"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                debugPrint(Navigator.of(context).canPop().toString());
              },
              child: const Text("Can Pop"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: const Text("Maybe Pop"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Pop"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("Screen2");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 2"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen3');
              },
              child: const Text("Push to Screen 3"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen1');
              },
              child: const Text("Push to Screen 1 instead of Pop"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                String userName = "Istvan Tiszai";
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Screen5(userName: userName)));
              },
              child: const Text("Push to Screen 5 using MaterialPageRoute"),
            ),
          ],
        ),
      ),
    );
  }
}

// pushReplacementNamed()  example
// popAndPushNamed()  example
// pushNamedAndRemoveUntil() example
// pushAndRemoveUntil() example
class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("Screen3");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 3"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                debugPrint(Navigator.of(context).canPop().toString());
              },
              child: const Text("Can Pop"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              child: const Text("Maybe Pop"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/screen4');
              },
              child: const Text("Push Replacement Named"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/screen4');
              },
              child: const Text("pop and Push Named"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/screen4', ModalRoute.withName('/screen1'));
                // Navigator.of(context).pushNamedAndRemoveUntil('/screen4', (Route<dynamic> route) => false);
              },
              child: const Text("Push Named and Remove Until"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const Screen4()),
                    ModalRoute.withName('/screen1'));
              },
              child: const Text("Push and Remove Until"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/screen4');
              },
              child: const Text("Push to Screen 4"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) {
                          return const Scaffold(
                            body: Center(
                                child: Center(child: Text('My PageRoute'))),
                          );
                        },
                        transitionsBuilder: (___, Animation<double> animation,
                            ____, Widget child) {
                          return FadeTransition(
                            opacity: animation,
                            child: RotationTransition(
                              turns: Tween<double>(begin: 0.5, end: 1.0)
                                  .animate(animation),
                              child: child,
                            ),
                          );
                        }));
              },
              child: const Text("Page Route Builder"),
            ),
          ],
        ),
      ),
    );
  }
}

// popUntil example
class Screen4 extends StatelessWidget {
  const Screen4({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("Screen4");

    return Scaffold(
      // 1
      appBar: AppBar(
        //2
        title: const Text("Screen 4"),
      ),
      body: Center(
        // 3
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/screen2'));
              },
              child: const Text("popUntil"),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () async {
                String value = await Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Center(
                    child: GestureDetector(
                        child: const Text('OK'),
                        onTap: () {
                          Navigator.pop(context, "Audio1");
                        }),
                  );
                }));
                debugPrint(value);
              },
              child: const Text("Return"),
            )
          ],
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  // const Screen5({super.key});
  final String? userName;
  const Screen5({this.userName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("Screen5");

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen 5"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Hi $userName"),
          ],
        ),
      ),
    );
  }
}

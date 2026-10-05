import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       useMaterial3: true,
  //     ),
  //     home: const MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }
  
  @override
  Widget build(BuildContext context) {
    const Widget myIcon = Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.car_rental, size: 60, color: Colors.green),
        Icon(Icons.do_disturb, size: 80, color: Colors.red),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Icon App')),
        body: Column(
          children: [
            myIcon,
            myIcon,
            const Center(
              child: Icon(Icons.favorite, size: 80, color: Colors.red),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Icon(Icons.do_disturb, size: 80, color: Colors.red),
                  ),
                  const Center(
                    child: Icon(
                      Icons.face_2_outlined,
                      size: 80,
                      color: Colors.green,
                    ),
                  ),
                  myIcon,
                  myIcon,
                  myIcon,
                  ],
              ),
            ),


            Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    debugPrint('Button pressed');
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const SecondScreen(),
                        
                      ),
                    );
                    debugPrint('Button pressed');
                  },
                  child: const Text('Open second screen'),
                );
              }
            ),
          ],  
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second screen')),
      body: Column(
        children: [
          const Center(child: Text('Second screen')),
          Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  debugPrint('Button pressed');
                  Navigator.pop(context);
                  debugPrint('Button pressed');
                },
                child: const Text('Go back!'),
              );
            }
          ),
        ],
      ),
    );
  }
}
// class CustomColumn extends StatelessWidget {
//   const CustomColumn({super.key, required this.children});

//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: children,
//     );
//   }
// }
// class CustomIcon extends StatelessWidget {
//   const CustomIcon({
//     super.key,
//     required this.icon,
//     required this.size,
//     required this.color,
//   });

//   final IconData icon;
//   final double size;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return Icon(
//       icon,
//       size: size,
//       color: color,
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

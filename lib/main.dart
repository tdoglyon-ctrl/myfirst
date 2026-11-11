
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  int _counter = 0;
  final Set<Marker> _markers = {};

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  final Widget myIcon = const Stack(
    alignment: Alignment.center,
    children: [
      Icon(Icons.car_rental, size: 60, color: Colors.green),
      Icon(Icons.do_disturb, size: 80, color: Colors.red),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      // HOME TAB
      Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondScreen(),
                ),
              );
            },
            child: const Text('Open second screen'),
          ),
        ],
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.fish, size: 80, color: Colors.blue),
            Text(
              'Fish 1',
              style: TextStyle(fontSize: 24),
            ), 
            
            SizedBox(height: 20),
            Text('Fish 1:'),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 30),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
            SizedBox(
              height: 600,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(39.2090, -76.0660),
                  zoom: 12,
                ),
                markers: _markers,
                mapType: MapType.normal,
                zoomControlsEnabled: true,
              ),
            ),
          ],
        ),
      ),

      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.set_meal, size: 80, color: Colors.green),
            const Text(
              'Fish 2',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text('Fish 2:'),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 30),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Icon App'),
        backgroundColor: Colors.blue,
      ),

      body: SingleChildScrollView(
        child: pages[selectedIndex],
      ),

      // THREE BOTTOM TABS
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.fish),
            label: 'fish 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'fish 2',
          ),
        ],
      ),
    );
  }
}

// SECOND SCREEN
class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}


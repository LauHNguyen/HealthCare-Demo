import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(255, 146, 145, 1)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'nah'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Function to handle item tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'Selected Index: $_selectedIndex',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // để hiển thị tất cả các item
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/schedule.svg'),
              size: 24,
            ),
            label: 'Schedule',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/track.svg'),
              size: 24,
            ),
            label: 'Track',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 45, // Đặt kích thước chiều rộng của hình tròn
              height: 45, // Đặt kích thước chiều cao của hình tròn
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Thiết lập hình dạng tròn
                color: const Color.fromRGBO(
                    255, 146, 145, 1), // Màu nền cho hình tròn
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white, // Màu cho icon
              ),
            ),
            label: ' ',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/chat.svg'),
              size: 24,
            ),
            label: 'Chat',
          ),
          const BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/profile.svg'),
              size: 24,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(255, 146, 145, 1),
        onTap: _onItemTapped,
      ),
    );
  }
}

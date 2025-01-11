import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/recipe_screen.dart';
import 'screens/post_screen.dart';
import 'models/recipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 206, 100, 86),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.blue,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const PostScreen(),
    const ProfileScreen(),
    const RecipeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: const Color(0xFF2196F3),
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            selectedFontSize: 14,
            unselectedFontSize: 12,
            elevation: 20,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 28,
                ),
                activeIcon: Icon(
                  Icons.home,
                  size: 28,
                ),
                label: 'Trang chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.explore_outlined,
                  size: 28,
                ),
                activeIcon: Icon(
                  Icons.explore,
                  size: 28,
                ),
                label: 'Khám phá',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2 
                        ? const Color(0xFF2196F3)
                        : Colors.grey.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
                label: 'Đăng bài',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 28,
                ),
                activeIcon: Icon(
                  Icons.person,
                  size: 28,
                ),
                label: 'Cá nhân',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.restaurant_menu_outlined,
                  size: 28,
                ),
                activeIcon: Icon(
                  Icons.restaurant_menu,
                  size: 28,
                ),
                label: 'Món ăn',
              ),
            ],
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
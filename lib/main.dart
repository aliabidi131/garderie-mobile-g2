import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaGarderieApp());
}

class MaGarderieApp extends StatelessWidget {
  const MaGarderieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ma Garderie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F9DF8),
          surface: const Color(0xFFFFFBF7),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFFBF7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4F9DF8),
          foregroundColor: Colors.white,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/garderie_accueil.png',
                  height: 390,
                  fit: BoxFit.contain,
                  semanticLabel: 'Illustration de bienvenue à la garderie',
                ),
                const SizedBox(height: 18),
                Text(
                  'Ma Garderie',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF2769B5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Bienvenue dans notre garderie',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(color: const Color(0xFF5D6472)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        actions: [
          IconButton(
            tooltip: 'Recherche',
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const DrawerHeader(
                margin: EdgeInsets.zero,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.child_care,
                        size: 48,
                        color: Color(0xFF4F9DF8),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Ma Garderie',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Accueil'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('Menus'),
                onTap: () => Navigator.of(context).pop(),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('À propos'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Menus du jour',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: const Color(0xFF263858),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Expanded(
              child: Center(child: Text('Les menus seront affichés ici.')),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ajouter un menu',
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

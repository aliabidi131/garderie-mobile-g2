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

const menusDuJour =
    <({int id, String titre, String description, String icone})>[
      (
        id: 1,
        titre: 'Petit déjeuner',
        description: 'Lait, céréales et fruits',
        icone: '🥣',
      ),
      (
        id: 2,
        titre: 'Déjeuner',
        description: 'Poulet, riz et légumes',
        icone: '🍲',
      ),
      (
        id: 3,
        titre: 'Goûter',
        description: 'Biscuit et compote de pomme',
        icone: '🍪',
      ),
      (
        id: 4,
        titre: 'Jus de fruits',
        description: "Jus d'orange naturel",
        icone: '🍊',
      ),
      (
        id: 5,
        titre: 'Fruits frais',
        description: 'Une sélection de fruits de saison',
        icone: '🍎',
      ),
    ];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedDestination = 'Accueil';

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void _selectDestination(String destination) {
    setState(() => _selectedDestination = destination);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        actions: [
          IconButton(
            tooltip: 'Recherche',
            onPressed: () => _showMessage('Rechercher un menu'),
            icon: const Icon(Icons.search),
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => _showMessage('Aucune notification'),
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
                selected: _selectedDestination == 'Accueil',
                onTap: () => _selectDestination('Accueil'),
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('Menus'),
                selected: _selectedDestination == 'Menus',
                onTap: () => _selectDestination('Menus'),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('À propos'),
                selected: _selectedDestination == 'À propos',
                onTap: () => _selectDestination('À propos'),
              ),
            ],
          ),
        ),
      ),
      body: _selectedDestination == 'À propos'
          ? const Center(child: Text('Ma Garderie — Gestion des menus'))
          : _buildMenus(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ajouter un menu',
        onPressed: () => _showMessage('Ajouter un menu'),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMenus() {
    return Padding(
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
          Expanded(
            child: ListView.separated(
              itemCount: menusDuJour.length,
              separatorBuilder: (_, _) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final menu = menusDuJour[index];
                return Card(
                  margin: EdgeInsets.zero,
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => _showMessage(menu.titre),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 14,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26,
                            backgroundColor: const Color(0xFFEAF3FF),
                            child: Text(
                              menu.icone,
                              style: const TextStyle(fontSize: 25),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.titre,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  menu.description,
                                  style: TextStyle(
                                    color: Colors.blueGrey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Color(0xFF718096),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

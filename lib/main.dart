import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/vessel_provider.dart';
import 'screens/map_screen.dart';
//test
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => VesselProvider(),
      child: MaterialApp(
        title: 'MSC Vessel Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF001F54),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF001F54),
            primary: const Color(0xFF001F54),
            secondary: const Color(0xFF6BB6D6),
          ),
          useMaterial3: true,
        ),
        home: const MapScreen(),
      ),
    );
  }
}

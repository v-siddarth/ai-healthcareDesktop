import 'package:doctordesktop/authProvider/auth_provider.dart';
import 'package:doctordesktop/constants/AppTheme.dart';
import 'package:doctordesktop/landing_page.dart';
import 'package:doctordesktop/services/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) {
        return MaterialApp(
          scaffoldMessengerKey: SnackbarService.rootScaffoldMessengerKey,

          title: 'Flutter Windows App',
          theme: AppTheme.lightTheme,
          // home: CreateSaleScreen(),
          // home: PrescriptionToSaleScreen(),
          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // Check authentication status on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authControllerProvider.notifier).checkLoginStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    // return HmsApp();
    // return ThemeShowcaseScreen();
    return const LandingPage();
    // MedicalRecordsScreen(
    //   patientId: 'LAL361', // Example patient ID
    //   admissionId: '6891097233773366b828eefe', // Example admission ID
    // );
  }

  // Drawer widget
}

import 'package:flutter/material.dart';
import 'package:gym_shift/app/routes.dart';
import 'package:gym_shift/provider/auth_provider.dart';
import 'package:provider/provider.dart';
// import 'package:gym_shift/screens/ChallengesPage/challenges_page.dart';
// import 'package:gym_shift/screens/ExercisePage/components/exercise_demo.dart';
// import 'package:gym_shift/screens/ExercisePage/exercise_page.dart';
// import 'package:gym_shift/screens/HomePage/home_page.dart';
// import 'package:gym_shift/screens/LocalGyms/components/gym_details.dart';
// import 'package:gym_shift/screens/LocalGyms/components/reviews_page.dart';
// import 'package:gym_shift/screens/LocalGyms/local_gyms.dart';
// import 'package:gym_shift/screens/MealPlans/meal_plans.dart';
// import 'package:gym_shift/screens/Notifications/notifications_page.dart';

// import 'package:gym_shift/screens/Onboarding/onboarding_screen.dart';
// import 'package:gym_shift/screens/ProfilePage/profile_page.dart';
// import 'package:gym_shift/screens/ProfileSetup/allergies_page.dart';
// import 'package:gym_shift/screens/ProfileSetup/bmi_page.dart';
// import 'package:gym_shift/screens/ProfileSetup/profile_photo_page.dart';
// import 'package:gym_shift/screens/ProfileSetup/workout_goal.dart';
// import 'package:gym_shift/screens/Auth/forgot_password.dart';
// import 'package:gym_shift/screens/Auth/login/login_page.dart';
// import 'package:gym_shift/screens/Auth/otp_screen.dart';
// import 'package:gym_shift/screens/Auth/registration_screen.dart';
// import 'package:gym_shift/screens/Auth/sign_up/signup_page.dart';
// import 'package:gym_shift/screens/Settings/settings.dart';
// import 'package:gym_shift/screens/SplashScreen/splash_screen.dart';
// import 'package:gym_shift/screens/SubscriptionPage/subscription_page.dart';
// import 'package:gym_shift/screens/WorkoutPlans/workout_plans.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GymShift demo',
        initialRoute: '/',
        onGenerateRoute: generateRoutes,
      ),
    );
  }
}

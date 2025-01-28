import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_neighborhod_app/app_route.dart';
import 'package:smart_neighborhod_app/components/constants/app_color.dart';
import 'package:smart_neighborhod_app/components/constants/app_image.dart';
import 'package:smart_neighborhod_app/models/Block.dart';
import 'package:smart_neighborhod_app/views/residential_block_detial.dart';
import 'components/constants/app_route.dart';
import 'views/onboarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(SmartNeighbourhood(appRouter: AppRouter()));
}

class SmartNeighbourhood extends StatelessWidget {
   SmartNeighbourhood({super.key, required this.appRouter});
  // Block block=Block.fromJson({"id":1,"name":"المربع السكني الأول","manager":"خالد عمر سعيد","Image":AppImage.residentailimage});
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        fontFamily: 'Tajawal-Regular',
      ),
      // home:  ResiddentialBlocksDetail(),
      onGenerateRoute: appRouter.generateRoute,
      initialRoute: AppRoute.residentialBlockDetial, 
    );
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('Event: ${bloc.runtimeType}, $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('State Change: ${bloc.runtimeType}, $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('Transition: ${bloc.runtimeType}, $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    debugPrint('Error: ${bloc.runtimeType}, $error');
  }
}

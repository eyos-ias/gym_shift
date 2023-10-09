part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppLoading extends AppState {}

final class AppInitial extends AppState {}

final class AppAuthenticated extends AppState {}

final class AppUnauthenticated extends AppState {}

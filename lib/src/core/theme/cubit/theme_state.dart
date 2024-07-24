part of 'theme_cubit.dart';

final class ThemeState extends Equatable {
 final ThemeMode themeMode;

  const ThemeState({this.themeMode = ThemeMode.system});

  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(themeMode: ThemeMode.values[map['themeMode'] as int]);
  }

  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode.index
    };
  }

  @override
  List<Object?> get props => [themeMode];
}
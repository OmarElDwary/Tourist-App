import 'package:flutter_test/flutter_test.dart';
import 'package:tourist_app/views/blocs/theme/theme_bloc.dart';
import 'package:tourist_app/views/blocs/theme/theme_event.dart';
import 'package:tourist_app/views/blocs/theme/theme_state.dart';

void main() {
  group('ThemeBloc Test', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    tearDown(() {
      themeBloc.close();
    });

    test('Initial state should be LightThemeState', () {
      expect(themeBloc.state, isA<LightThemeState>());
    });

    test('Toggling theme should switch to DarkThemeState', () {
      themeBloc.add(ToggleTheme());
      expectLater(
        themeBloc.stream,
        emitsInOrder([
          isA<DarkThemeState>(),
        ]),
      );
    });

    test('Toggling theme twice should switch back to LightThemeState', () {
      themeBloc.add(ToggleTheme());
      themeBloc.add(ToggleTheme());
      expectLater(
        themeBloc.stream,
        emitsInOrder([
          isA<DarkThemeState>(),
          isA<LightThemeState>(),
        ]),
      );
    });
  });
}

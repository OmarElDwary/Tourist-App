import 'package:flutter_test/flutter_test.dart';
import 'package:tourist_app/views/cubits/changeLanguage/change_language_cubit.dart';

void main() {
  group('Change Language test', () {
    late ChangeLanguageCubit changeLanguageCubit;

    changeLanguageCubit = ChangeLanguageCubit();

    test('Main language should be English', () {
      expect(changeLanguageCubit.state.locale.languageCode, 'en');
    });

    test('Change Language to Arabic', () {
      changeLanguageCubit.changeLanguage('ar');

      expect(changeLanguageCubit.state.locale.languageCode, 'ar');
    });
  });
}

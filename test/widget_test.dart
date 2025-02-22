import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tourist_app/services/users_firebase_services.dart';
import 'package:tourist_app/views/blocs/profile/profile_bloc.dart';
import 'package:tourist_app/views/screens/edit_profile_screen.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseServices extends Mock implements UsersFirebaseServices {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  testWidgets('text fields should be updated when new value enters',
      (WidgetTester tester) async {
    final mockUsersFirebaseServices = MockFirebaseServices();
    await tester.pumpWidget(MaterialApp(
        home: Provider<ProfileBloc>(
            create: (_) => ProfileBloc(mockUsersFirebaseServices),
            child: EditProfilePage())));

    final textFields = find.byType(TextFormField);
    expect(textFields, findsNWidgets(3));

    debugDumpApp();

    await tester.enterText(textFields.at(0), 'Omar');
    await tester.enterText(textFields.at(1), 'omer@yahoo.com');
    await tester.enterText(textFields.at(2), '1234567');

    expect(find.text('Omar'), findsOneWidget);
    expect(find.text('omer@yahoo.com'), findsOneWidget);
    expect(find.text('1234567'), findsOneWidget);
  });
}

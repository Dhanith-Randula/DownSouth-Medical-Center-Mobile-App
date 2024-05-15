
import 'package:flutter_test/flutter_test.dart';
import 'package:flash_chat/screens/signin_screen.dart';
import 'package:flash_chat/components/roundedbutton.dart';

void main() {
  testWidgets('LoginScreen Widget Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(SignInScreen());

    // Verify that our widget is working well.
    // For example, let's find a RaisedButton widget and tap on it
    var findButton = find.byType(RoundedButton);
    expect(findButton, findsOneWidget);

    // Tap on the RaisedButton widget and trigger a frame.
    await tester.tap(findButton);
    await tester.pump();

    // Verify that our button has been tapped.
    // This is just an example, replace with your own conditions
    expect(find.text('Login'), findsOneWidget);
  });
}
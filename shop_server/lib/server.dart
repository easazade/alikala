import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:serverpod/serverpod.dart';
import 'package:shop_server/src/seeds/seeder.dart';

import 'package:shop_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

import 'package:serverpod_auth_server/module.dart' as auth;

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  // Configuration for sign in with email.
  // You have to setup an App Password with gmail for this to work
  // see https://support.google.com/accounts/answer/185833?hl=en for how to do that.
  // Then add the email and password to the config/passwords.yaml file.
  // This is a test example, do not use this type of integration in production
  // as that may lead to you getting blocked for spam and other issues.
  // Instead use a real email service provider, such as SendGrid, Mailjet or others.
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      // Create a SMTP client for Gmail.
      final smtpServer = SmtpServer(
        'localhost',
        port: 2500,
        ssl: false,
        allowInsecure: true,
        ignoreBadCertificate: true,
      );

      // Create an email message with the validation code.
      final message = Message()
        ..from = Address('hello.shop.com@gmail.com')
        ..recipients.add(email)
        ..subject = 'Verification code for Serverpod'
        ..html = 'Your verification code is: $validationCode';

      // Send the email message.
      try {
        await send(message, smtpServer);
      } catch (e, stacktrace) {
        session.log(
          'Something went wrong when trying to send email',
          level: LogLevel.error,
          exception: e,
          stackTrace: stacktrace,
        );
        return false;
      }

      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      // Create a SMTP client for Gmail.
      final smtpServer = SmtpServer(
        'localhost',
        port: 2500,
        ssl: false,
        allowInsecure: true,
        ignoreBadCertificate: true,
      );

      // Create an email message with the password reset link.
      final message = Message()
        ..from = Address('hello.shop.com@gmail.com')
        ..recipients.add(userInfo.email!)
        ..subject = 'Password reset link for Serverpod'
        ..html = 'Here is your password reset code: $validationCode>';

      // Send the email message.
      try {
        await send(message, smtpServer);
      } catch (e, stacktrace) {
        session.log(
          'Something went wrong when trying to send email',
          level: LogLevel.error,
          exception: e,
          stackTrace: stacktrace,
        );
        // Return false if the email could not be sent.
        return false;
      }

      return true;
    },
  ));

  // Start the server.
  await pod.start();
  print('pod started. !!! MEOW MEOW MEOW');

  final internalSession = await pod.createSession();

  print('server running in ${internalSession.serverpod.runMode} mode');

  if (internalSession.serverpod.runMode == 'development') {
    await Seeder.insertSeedData(internalSession);
  }
}

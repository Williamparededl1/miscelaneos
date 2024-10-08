import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';

class LocalAuthPlugin {
  static final LocalAuthentication auth = LocalAuthentication();

  static availableBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      // Some biometrics are enrolled.
    }

    if (availableBiometrics.contains(BiometricType.strong) ||
        availableBiometrics.contains(BiometricType.face)) {
      // Specific types of biometrics are available.
      // Use checks like this with caution!
    }
  }

  static Future<bool> canCheckBiometrics() async {
    return await auth.canCheckBiometrics;
  }

  static Future<(bool, String)> authenticate() async {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason: 'Por Favor Autoriza para Continuar',
          options: const AuthenticationOptions(
              // biometricOnly: true // false podemos colocar el Pin
              ));
      return (
        didAuthenticate,
        didAuthenticate ? 'Desbloqueado' : 'Cancelado por el usuario'
      );
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        return (false, 'No hay biometricos Enrolados');
      }

      if (e.code == auth_error.lockedOut) {
        return (false, 'Demasiados Intentos Fallidos');
      }

      if (e.code == auth_error.notAvailable) {
        return (false, 'No hay Biometricos Disponibles');
      }

      if (e.code == auth_error.passcodeNotSet) {
        return (false, 'No hay Pin Disponiible');
      }
      if (e.code == auth_error.permanentlyLockedOut) {
        return (false, 'Se requiere desbloquear el Telefono');
      }

      return (false, e.toString());
    }
  }
}

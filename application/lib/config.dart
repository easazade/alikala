// The android emulator does not have access to the localhost of the machine.
// const ipAddress = '10.0.2.2'; // Android emulator ip for the host

// On a real device replace the ipAddress with the IP address of your computer.

class AppConfig {
  static const ipAddress = '192.168.1.100';
  static const baseUrl = 'http://$ipAddress:8080/';
}

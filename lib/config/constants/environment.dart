import 'dart:io';

enum EnvironmentType { mock, development, staging, production }

class Environment {
  static const EnvironmentType currentEnvironment = EnvironmentType.staging;

  static String? get apiUrl {
    switch (currentEnvironment) {
      case EnvironmentType.mock:
        return null;
      case EnvironmentType.development:
        return Platform.isAndroid
            ? 'http://192.168.1.6:8000/api'
            : 'http://localhost:8000/api';
      case EnvironmentType.staging:
        return 'https://www.appedir.net/cronfit_test/public/api';
      case EnvironmentType.production:
        return 'https://www.appedir.net/cronfit/public/api';
    }
  }

  // Método para obtener la implementación del datasource basado en el entorno
  static T getDataSource<T>({
    required T mock,
    required T development,
    required T staging,
    required T production,
  }) {
    switch (currentEnvironment) {
      case EnvironmentType.mock:
        return mock;
      case EnvironmentType.development:
        return development;
      case EnvironmentType.staging:
        return staging;
      case EnvironmentType.production:
        return production;
    }
  }
}

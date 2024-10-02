import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Please provide a feature name.');

    return;
  }

  String featureName = arguments[0];

  String basePath = 'lib/features/$featureName';

  // Define the folder structure

  List<String> folders = [
    '$basePath/data/models',
    '$basePath/data/datasources',
    '$basePath/data/repositories',
    '$basePath/presentation/widgets',
    '$basePath/presentation/screens',
  ];

  // Create folders

  for (String folder in folders) {
    Directory(folder).createSync(recursive: true);

    print('Created folder: $folder');
  }

  // Create template files with placeholder content

  _createDataSourceFile(featureName, '$basePath/data/datasources');

  // You can add more files like _createRepositoryFile(featureName, ...) similarly

  print(
      'All folders and template files for feature "$featureName" have been created.');
}

/// Function to create a DataSource file with a template code

void _createDataSourceFile(String featureName, String path) {
  // Define file name based on feature name

  String fileName = '${featureName}_datasource.dart';

  String filePath = '$path/$fileName';

  // Prepare the content for the data source file

  String content = '''

class ${_capitalize(featureName)}DataSource {

}

  ''';

  // Write content to the file

  File file = File(filePath);

  file.writeAsStringSync(content);

  print('Created file: $filePath');
}

/// Helper function to capitalize the feature name for class names

String _capitalize(String str) {
  return str[0].toUpperCase() + str.substring(1);
}

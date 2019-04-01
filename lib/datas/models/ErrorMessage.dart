import 'package:uuid/uuid.dart';

class ErrorMessage extends Error {
  ErrorMessage(this.title, this.description);

  final Uuid id = Uuid();
  final String title;
  final String description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ErrorMessage &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode =>
      id.hashCode;
}
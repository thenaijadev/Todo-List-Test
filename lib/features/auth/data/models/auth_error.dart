// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthError {
  final String errorMessage;
  AuthError({
    required this.errorMessage,
  });

  @override
  String toString() => 'AuthError(errorMessage: $errorMessage)';
}

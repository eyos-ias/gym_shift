import 'package:formz/formz.dart';
import 'package:gym_shift/Models/auth/Login.dart';

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return value?.contains('@') == true ? null : EmailValidationError.invalid;
  }
}

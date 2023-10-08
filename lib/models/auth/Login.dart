// import 'package:formz/formz.dart';

// enum PasswordInputError { tooShort, noDigit, noUppercase, noSpecialChar }

// class PasswordInput extends FormzInput<String, PasswordInputError> {
//   const PasswordInput.pure() : super.pure('');

//   const PasswordInput.dirty([String value = '']) : super.dirty(value);

//   @override
//   PasswordInputError? validator(String value) {
//     // TODO: implement validator
//     if (value.length < 8) {
//       return PasswordInputError.tooShort;
//     }
//     if (!value.contains(RegExp(r'[0-9]'))) {
//       return PasswordInputError.noDigit;
//     }
//     if (!value.contains(RegExp(r'[A-Z]'))) {
//       return PasswordInputError.noUppercase;
//     }
//     ;
//   }
// }
import 'package:formz/formz.dart';

enum EmailValidationError { invalid }

enum PasswordValidationError { invalid }

enum UsernameValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return value?.contains('@') == true ? null : EmailValidationError.invalid;
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : PasswordValidationError.invalid;
  }
}

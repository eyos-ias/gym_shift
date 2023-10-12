# Gym fit

<details >
    <summary>Dependencies </summary>
    <ul>
    <li>bloc, flutter_bloc & equatable</li>
    <li>another_flutter_splash_screen</li>
    <li>Hive</li>
    <li> Flutterbloc </li>
    <li> Gorouter</li>
    </ul>

</details>

# Routes
```dart
Map<String, Widget Function(BuildContext)> appRoutes = {
  '/': (context) => const OnboardingScreen(),
  '/onboarding': (context) => const OnboardingScreen(),
  '/registration': (context) => const RegistrationPage(),
  '/profile_setup': (context) => const ProfilePicturePage(),
  '/homepage': (context) => const HomePage(),
  '/local_gyms': (context) => const LocalGymsPage(),
  '/notifications': (context) => const NotificationsPage(),
  '/workout_plans': (context) => const WorkoutPlans(),
  '/meal_plans': (context) => const MealPlansPage(),
  '/local_gym': (context) => const LocalGymsPage(),
  '/profile': (context) => ProfilePage(),
  '/settings': (context) => const SettingsPage(),
  '/subscription': (context) => const SubscriptionPage(),
  '/challenges': (context) => const ChallengesPage()
};
```

# Todos
- -  Gym Cards
- Variations modal
- workout demonstration
- meal plan
- Food Item Details
- Subscription Page
- Challenges page
- Place holder in place of maps

# Done
- reviews page and card

# Routes
```javascript
app.use("/user", userRoute);

import express from "express";

import {
  //DietFunction
  //,
  Signin,
  Signup,
  completeProfile,
  resendOtpVerification,
  verifyOtp,
} from "../controllers/user.js";

const router = express.Router();

// router.get("/" , getSigninPost )
router.get("/", (req, res)=>{res.send("hello");})
router.post("/signin", Signin);
router.post("/signup", Signup);
router.post("/verifyotp", verifyOtp);
router.post("/resendotpverification", resendOtpVerification);
//router.post("/fitness/diet", DietFunction);
//router.post("/fitness/workoutplan", Signup);
router.post("/completeprofile", completeProfile);

export default router;

```


# User Controller

```javascript
import bcrypt from "bcryptjs";

import UserSchema from "../models/user.js";
import OTPSchema from "../models/UserOTPVerification.js";
import dotenv from "dotenv";
import { sendEmail } from "../utiles/sendEmail.js";

dotenv.config();

export const Signin = async (req, res) => {
  // We send email amd password to signin

  const { email, password } = req.body;

  try {
    const existingUser = await UserSchema.findOne({ email });

    if (!existingUser)
      return res.status(404).json({ message: "User doesn't exist" });

    console.log(existingUser);

    const isPasswordCorrect = await bcrypt.compare(
      password,
      existingUser.password
    );

    if (!isPasswordCorrect)
      return res.status(400).json({ message: "Invalid Credentials" });

    if (existingUser.verified == false) {
      const otp = `${Math.floor(1000 + Math.random() * 9000)}`;
      const saltotp = await bcrypt.genSalt(10);
      const hashedOtp = await bcrypt.hash(otp, saltotp);
      const newOptVerification = await new OTPSchema({
        userId: existingUser._id,
        otp: hashedOtp,
        createdAt: Date.now(),
        expiresAt: Date.now() + 300000,
      });

      await newOptVerification.save();
      await sendEmail(email, "Verify Your Email", otp);

      return res.status(200).json({
        status: "Pending",
        message: "Verification Code sent to Email",
      });
    }

    res.status(200).json({ result: existingUser });
  } catch (error) {
    res.status(500).json({ message: "Something went wrong" });
  }
};

export const Signup = async (req, res) => {
  // Signup page send email , password , fullname , gender, confirmPassword
  // to the server .

  const { email, password, fullName, gender, confirmPassword } = req.body;

  try {
    const existingUser = await UserSchema.findOne({ email });

    if (existingUser)
      return res.status(400).json({ message: "User already exist" });

    if (password !== confirmPassword)
      return res.status(400).json({ message: "Password doesn't match" });

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const result = await UserSchema.create({
      ...req.body,
      password: hashedPassword,
      confirmPassword: hashedPassword,
    });

    // We receive result in the rontend which is the body sent .

    const otp = `${Math.floor(1000 + Math.random() * 9000)}`;
    const saltotp = await bcrypt.genSalt(10);
    const hashedOtp = await bcrypt.hash(otp, saltotp);
    const newOptVerification = await new OTPSchema({
      userId: result._id,
      otp: hashedOtp,
      createdAt: Date.now(),
      expiresAt: Date.now() + 300000,
    });

    await newOptVerification.save();
    await sendEmail(email, "Verify Your Email", otp);

    res.status(200).json({
      status: "Pending",
      message: "Verification Code Sent to Email",
      result,
    });
  } catch (error) {
    res.status(500).json({ message: "Something Went Wrong" });
  }
};

/// Verify your otp code
export const verifyOtp = async (req, res) => {
  // collect userId which is the _id of the user and the otp sent to the email
  // This happens when you have sign up , so you sen the otp sent to your mail and userId

  const { userId, otp } = req.body;
  try {
    if (!userId || !otp) {
      res.send("Otp not allowed");
    } else {
      const user = await OTPSchema.find({ userId });
      if (user.length <= 0) {
        res.send("Account Verified");
      } else {
        const { expiresAt } = user[0];
        const hashedOtp = user[0].otp;

        if (expiresAt < Date.now()) {
          await OTPSchema.deleteMany({ userId });
          res.send("Code Expired");
        } else {
          const isOtpCorrect = await bcrypt.compare(otp, hashedOtp);

          if (!isOtpCorrect) {
            res.send("Code Pass Invalid");
          } else {
            await UserSchema.updateOne({ _id: userId }, { verified: true });
            await OTPSchema.deleteMany({ userId });
            res.json({
              status: "Verified",
              message: "Email has been verified",
            });
          }
        }
      }
    }
  } catch (error) {
    res.json({
      status: "Failed",
      message: error.message,
    });
  }
};

export const resendOtpVerification = async (req, res) => {
  // Resend otp verification would send userid which is the _id , userId : _id , and email to the server , this are post function

  try {
    const { userId, email } = req.body;
    if (!userId || !email) {
      res.send("Empty User Details");
    } else {
      await OTPSchema.deleteMany({ userId });
      const otp = `${Math.floor(1000 + Math.random() * 9000)}`;
      const salt = await bcrypt.genSalt(10);
      const hashedOtp = await bcrypt.hash(otp, salt);
      const newOptVerification = await new OTPSchema({
        userId,
        otp: hashedOtp,
        createdAt: Date.now(),
        expiresAt: Date.now() + 300000,
      });

      await newOptVerification.save();
      await sendEmail(email, "Verify Your Email", otp);
      res.json({
        status: "Pending",
        message: "Verification Image Sent",
        date: {
          userId,
          email,
        },
      });
    }
  } catch (error) {
    res.json({
      status: "Failed",
      message: error.message,
    });
  }
};

/// This is to complete the profile after they have sign up and verify there otp code
export const completeProfile = async (req, res) => {
  const { id, bmi, height, weight, age, workoutGoal, profilePic, allergies } =
    req.body;

  // we send id , bmi , height , weight , age , workoutGoal, profilePic, allergies to the server from frontend , the id is _id which is created when the user sign up

  try {
    const updatedProfile = {
      bmi,
      height,
      weight,
      age,
      workoutGoal,
      profilePic,
      allergies,
    };

    const result = await UserSchema.findByIdAndUpdate(id, updatedProfile, {
      new: true,
    });
    res.status(200).json({ result });
  } catch (error) {
    res.status(500).json({ message: "Something Went Wrong" });
  }
};
```
# Form Inputs
```dart

//EMAIL

/// Validation errors for the [Email] [FormzInput].
enum EmailValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

///Password
import 'package:formz/formz.dart';

/// Validation errors for the [Password] [FormzInput].
enum PasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template password}
/// Form input for an password input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}

/// Validation errors for the [ConfirmedPassword] [FormzInput].
enum ConfirmedPasswordValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template confirmed_password}
/// Form input for a confirmed password input.
/// {@endtemplate}
class ConfirmedPassword
    extends FormzInput<String, ConfirmedPasswordValidationError> {
  /// {@macro confirmed_password}
  const ConfirmedPassword.pure({this.password = ''}) : super.pure('');

  /// {@macro confirmed_password}
  const ConfirmedPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  /// The original password.
  final String password;

  @override
  ConfirmedPasswordValidationError? validator(String? value) {
    return password == value ? null : ConfirmedPasswordValidationError.invalid;
  }
}
```
## user model
```javascript
{
  fullName: { type: String, required: true },
  email: { type: String, required: true },
  verified: { type: Boolean, default: false },
  password: { type: String, required: true },
  gender: { type: String, required: true },
  confirmPassword: { type: String, required: true },
  bmi: { type: String, default: "" },
  height: { type: String, default: "" },
  weight: { type: String, default: "" },
  age: { type: Number, default: "" },
  workoutGoal: { type: String, default: "" },
  profilePic: {
    type: String,
    default:
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
  },
  allergies: {
    type: [String],
    default: [],
  },
  id: { type: String },
}
```


## example response
### Sign in
```javascript
{
  _id: new ObjectId("6507edb20712a369d9216277"),
  fullName: 'Akintan Seyi',
  email: 'akintanseyi5@gmail.com',
  verified: true,
  password: '$2a$10$Xzo6C/cswtoac07YVR69He/bRBPo8wvyfwxSc87wtgHCMgAS79Gz6',
  gender: 'male',
  confirmPassword: '12345',
  bmi: '124gb',
  height: '35',
  weight: '56',
  age: 25,
  workoutGoal: 'Build Muscles',
  profilePic: '',
  allergies: [ "['rice' , 'beans' , 'garri']" ],
  __v: 0
}

```

### sign up
```json
{
    "status": "Pending",
    "message": "Verification Code Sent to Email",
    "result": {
        "fullName": "Eyosias T.",
        "email": "eyosiastamirat30@gmail.com",
        "verified": false,
        "password": "$2a$10$jjkXFzHwzqC1Cvrnf8xu3ucHQmCmONuRgVFa4mSLo9SoQDQ7rp.gC",
        "gender": "male",
        "confirmPassword": "$2a$10$jjkXFzHwzqC1Cvrnf8xu3ucHQmCmONuRgVFa4mSLo9SoQDQ7rp.gC",
        "bmi": "",
        "height": "",
        "weight": "",
        "age": null,
        "workoutGoal": "",
        "profilePic": "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
        "allergies": [],
        "_id": "6527c0141412f4126c3e7c1c",
        "__v": 0
    }
}
```
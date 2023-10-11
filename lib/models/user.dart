class User {
  final String id;
  final String fullName;
  final String password;
  final bool verified;
  final String gender;
  final String email;
  final String profileUrl;
  final String bmi;
  final String height;
  final String weight;
  final int age;
  final String workoutGoal;
  final List<String> allergies;

  User({
    required this.id,
    required this.fullName,
    required this.password,
    this.email = "",
    this.verified = false,
    this.gender = "",
    this.profileUrl =
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
    this.bmi = "",
    this.height = "",
    this.weight = "",
    this.age = 0,
    this.workoutGoal = "",
    this.allergies = const [],
  });
}

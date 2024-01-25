class User {
  final String firstName;
  final String lastName;
  final String? emailAddress;
  final int? age;
  final String? phoneNumber;
  final String? address;
  User._({
    required this.firstName,
    required this.lastName,
    this.emailAddress,
    this.age,
    this.phoneNumber,
    this.address,
  });
}

abstract class UserBuilder {
  String? firstName;
  String? lastName;
  String? emailAddress;
  int? age;
  String? phoneNumber;
  String? address;

  void setFirstName(String value) {
    firstName = value;
  }

  void setLastName(String value) {
    lastName = value;
  }

  void setEmailAddress(String value) {
    emailAddress = value;
  }

  void setAge(int value) {
    age = value;
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
  }

  void setAddress(String value) {
    address = value;
  }

  void validate() {
    if (firstName == null || lastName == null) {
      throw Exception('First name or Last name are empty');
    }
  }

  User build();
}

class AnonymousUserBuild extends UserBuilder {
  @override
  void setEmailAddress(String value) {
    throw Exception('Anonymous User cannot have an email');
  }

  @override
  User build() {
    validate();
    return User._(
        firstName: firstName!,
        lastName: lastName!,
        address: address,
        age: age,
        phoneNumber: phoneNumber,
        emailAddress: null);
  }
}

class RegisteredUserBuild extends UserBuilder {
  @override
  void validate() {
    super.validate();
    if (emailAddress == null) {
      throw Exception('Must have an Email Address');
    }
  }

  @override
  User build() {
    validate();
    return User._(
        firstName: firstName!,
        lastName: lastName!,
        address: address,
        age: age,
        emailAddress: emailAddress);
  }
}

class UserDirector {
  UserBuilder? userBuilder;
  void setBuilder(UserBuilder value) {
    userBuilder = value;
  }

  User getUser() {
    if (userBuilder == null) {
      throw Exception('User Builder is needed');
    }
    return userBuilder!.build();
  }
}

void main(List<String> args) {
  UserDirector userDirector = UserDirector();

  RegisteredUserBuild registeredUserBuild = RegisteredUserBuild()
    ..setFirstName('Joe')
    ..setLastName('Gordon')
    ..setEmailAddress('joe@ex.com');

  userDirector.setBuilder(registeredUserBuild);
  User finalUser = userDirector.getUser();
  print('Final User Email:${finalUser.emailAddress}');

  AnonymousUserBuild anonymousUserBuild = AnonymousUserBuild()
    ..setFirstName('Anon')
    ..setLastName('Nymous');

  userDirector.setBuilder(anonymousUserBuild);
  finalUser = userDirector.getUser();
  print('Final User Email:${finalUser.emailAddress}');
}

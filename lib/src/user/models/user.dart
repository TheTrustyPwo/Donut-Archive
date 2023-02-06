import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
    this.uid,
    this.username,
    this.phone,
    this.email,
    this.password,
    this.completedDeals,
    this.pendingDeals,
    this.about,
    this.profilePic,
  );

  final int uid, phone, completedDeals, pendingDeals;
  final String username, email, password, about, profilePic;

  @override
  List<Object> get props => [
        uid,
        username,
        phone,
        email,
        password,
        completedDeals,
        pendingDeals,
        about,
        profilePic
      ];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['uid'],
      json['username'],
      json['phone'],
      json['email'],
      json['password'],
      json['completedDeals'],
      json['pendingDeals'],
      json['about'],
      json['profilePic'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['username'] = username;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    data['completedDeals'] = completedDeals;
    data['pendingDeals'] = pendingDeals;
    data['about'] = about;
    data['profilePic'] = profilePic;
    return data;
  }

  static const empty = User(-1, "", -1, "", "", -1, -1, "", "");
}

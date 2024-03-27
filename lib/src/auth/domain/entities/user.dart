import 'package:equatable/equatable.dart';

class LocalUser extends Equatable {
  const LocalUser({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.points,
    this.groupIds = const [],
    this.enrolledCourseIds = const [],
    this.following = const [],
    this.followers = const [],
    this.profilePic,
    this.bio,
  });

  const LocalUser.empty()
      : this(
          uid: '',
          email: '',
          profilePic: '',
          bio: '',
          fullName: '',
          points: 0,
          groupIds: const [],
          enrolledCourseIds: const [],
          following: const [],
          followers: const [],
        );

  final String uid;
  final String email;
  final String? profilePic;
  final String? bio;
  final String fullName;
  final int points;
  final List<String> groupIds;
  final List<String> enrolledCourseIds;
  final List<String> following;
  final List<String> followers;

  @override
  List<Object?> get props => [uid, email];

  @override
  String toString() {
    return 'LocalUser{uid: $uid, email: $email, '
        'bio: $bio, points: $points, fullName: $fullName}';
  }

  // When print [LocalUser] only uid and email will be printed
  // not the [Instance of LocalUser].
  // Uncomment the below override if you dont want that.

  // @override
  // bool get stringify => true;
}

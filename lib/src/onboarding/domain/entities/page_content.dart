import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_tdd/core/res/media_res.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  const PageContent.first()
      : this(
          image: MediaRes.casualReading,
          title: 'Brand New Curriculum',
          subtitle:
              'This is the first online education platform designed by the '
              "World's Top Professors",
        );

  const PageContent.second()
      : this(
          image: MediaRes.casualLife,
          title: 'Brand a fun atmosphere',
          subtitle:
              'This is the first online education platform designed by the '
              "World's Top Professors",
        );

  const PageContent.third()
      : this(
          image: MediaRes.casualMeditationScience,
          title: 'Easy to join the lesson',
          subtitle:
              'This is the first online education platform designed by the '
              "World's Top Professors",
        );

  final String image;
  final String title;
  final String subtitle;

  @override
  List<Object?> get props => [image, title, subtitle];
}

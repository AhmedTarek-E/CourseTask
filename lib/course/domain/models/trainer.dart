import 'package:equatable/equatable.dart';

class Trainer extends Equatable {
  final int id;
  final String name;
  final String image;
  final String bio;

  const Trainer(this.id, this.name, this.image, this.bio);

  @override
  List<Object?> get props => [
    id, name, image, bio
  ];
}
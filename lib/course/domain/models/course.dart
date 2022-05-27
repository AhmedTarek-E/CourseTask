import 'package:equatable/equatable.dart';
import 'package:inovola_task/course/domain/models/trainer.dart';

class Course extends Equatable {
  final int id;
  final String name;
  final List<String> images;
  final bool isLiked;
  final String interest;
  final DateTime date;
  final String address;
  final Trainer trainer;
  final String description;
  final int price;

  const Course(
    this.id,
    this.name,
    this.images,
    this.isLiked,
    this.interest,
    this.date,
    this.address,
    this.trainer,
    this.description,
    this.price,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    images,
    isLiked,
    interest,
    date,
    address,
    trainer,
    description,
    price,
  ];
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inovola_task/course/data/models/api_course_result.dart';
import 'package:inovola_task/course/domain/models/course.dart';
import 'package:inovola_task/course/domain/repositories/course_repository.dart';

class CourseRepositoryImp implements CourseRepository {
  @override
  Future<Course> getCourseDetails() async {
    final uri = Uri.parse("https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34");
    final response = await http.get(uri);
    final result = ApiCourseResult.fromJson(jsonDecode(response.body));

  }

}
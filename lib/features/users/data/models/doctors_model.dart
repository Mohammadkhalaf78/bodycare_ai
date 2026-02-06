// To parse this JSON data, do
//
//     final doctorsModel = doctorsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


// String doctorsModelToJson(DoctorsModel data) => json.encode(data.toJson());

class DoctorsModel {
    final List<FormattedDoctor> formattedDoctors;

    DoctorsModel({
        required this.formattedDoctors,
    });

    factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
        formattedDoctors: List<FormattedDoctor>.from(json["formattedDoctors"].map((x) => FormattedDoctor.fromJson(x))),
    );

    // Map<String, dynamic> toJson() => {
    //     "formattedDoctors": List<dynamic>.from(formattedDoctors.map((x) => x.toJson())),
    // };
}

class FormattedDoctor {
    final String id;
    final String name;
    final String email;
    final String specialty;
    final String imageUrl;
    final List<double> coordinates;
    final String bio;

    FormattedDoctor({
        required this.id,
        required this.name,
        required this.email,
        required this.specialty,
        required this.imageUrl,
        required this.coordinates,
        required this.bio,
    });

    factory FormattedDoctor.fromJson(Map<String, dynamic> json) => FormattedDoctor(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        specialty: json["specialty"],
        imageUrl: json["imageUrl"],
        coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
        bio: json["bio"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "email": email,
    //     "specialty": specialty,
    //     "imageUrl": imageUrl,
    //     "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
    //     "bio": bio,
    // };
}

// File: lib/models.dart
import 'package:flutter/material.dart';

// Hospital Model
class Hospital {
  final String id;
  final String name;
  final String logoPath;
  final String? address;
  final String? phone;
  final List<String>? specialties;

  Hospital({
    required this.id,
    required this.name,
    required this.logoPath,
    this.address,
    this.phone,
    this.specialties,
  });
}

// Test Result Model
class TestResult {
  final String id;
  final String name;
  final String type;
  final DateTime date;
  final String hospitalName;
  final String doctorName;
  final String pdfPath;
  final Map<String, dynamic>? additionalInfo;

  TestResult({
    required this.id,
    required this.name,
    required this.type,
    required this.date,
    required this.hospitalName,
    required this.doctorName,
    required this.pdfPath,
    this.additionalInfo,
  });
}

// Patient Model
class Patient {
  final String id;
  final String name;
  final int age;
  final String bloodType;
  final DateTime lastVisit;
  final String? phone;
  final String? email;
  final List<String>? allergies;
  final List<String>? medications;

  Patient({
    required this.id,
    required this.name,
    required this.age,
    required this.bloodType,
    required this.lastVisit,
    this.phone,
    this.email,
    this.allergies,
    this.medications,
  });
}

// Appointment Model
enum AppointmentStatus { scheduled, completed, cancelled, noShow }

class Appointment {
  final String id;
  final String patientName;
  final String patientId;
  final TimeOfDay time;
  final String type;
  final AppointmentStatus status;
  final DateTime? date;
  final String? notes;

  Appointment({
    required this.id,
    required this.patientName,
    required this.patientId,
    required this.time,
    required this.type,
    required this.status,
    this.date,
    this.notes,
  });
}

// Doctor Model
class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String hospital;
  final String? phone;
  final String? email;
  final List<String>? availableDays;
  final List<TimeOfDay>? availableTimes;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.hospital,
    this.phone,
    this.email,
    this.availableDays,
    this.availableTimes,
  });
}

// News Model
class News {
  final String id;
  final String title;
  final String description;
  final String content;
  final String imageUrl;
  final DateTime publishDate;
  final String category;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.publishDate,
    required this.category,
  });
}

// Chat Message Model
class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
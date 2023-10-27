import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetSecureStorage.init(
      password:
          "21938nsdaisudh2i138y18yh8d7128y12983729e8qw7dbuqwyod8721y87123t85367t21ybudy");
  runApp(const SayFood());
}

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:notes_app_sql/screens/add%20note/add_note.dart';
import 'package:notes_app_sql/screens/home/home_page.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(name: "/", page: () => HomePage()),
  GetPage(name: "/add_note", page: () => AddNotesPage()),
];

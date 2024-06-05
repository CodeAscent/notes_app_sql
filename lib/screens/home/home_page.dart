import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:notes_app_sql/constants/app_colors.dart';
import 'package:notes_app_sql/constants/custom_padding.dart';
import 'package:notes_app_sql/constants/custom_snackbar.dart';
import 'package:notes_app_sql/controllers/drawer_controller.dart';
import 'package:notes_app_sql/controllers/show_fav_controller.dart';
import 'package:notes_app_sql/models/notes_model.dart';
import 'package:notes_app_sql/screens/add%20note/add_note.dart';
import 'package:notes_app_sql/screens/home/home_drawer.dart';
import 'package:notes_app_sql/services/database_helper.dart';
import 'package:notes_app_sql/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final drawerController = Get.find<DrawerCustomController>();
  final showFavController = Get.find<ShowFavouriteController>();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        color: secondaryColor(),
        width: double.infinity,
        height: double.infinity,
      ),
      controller: drawerController.getDrawerController(),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: HomeDrawer(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: CustomAppBar(
            label: "Notes",
            showLeading: false,
          ),
        ),
        body: SingleChildScrollView(
          child: customPadding(
            Column(
              children: [
                FutureBuilder<List<Note>?>(
                  future: DatabaseHelper.getNotes(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Note>?> snapshot) {
                    if (snapshot.hasData) {
                      dynamic data = snapshot.data!;
                      List<Note> sortedNotes = List.from(snapshot.data!);
                      sortedNotes.sort((a, b) =>
                          DateFormat("MMM dd, yyyy, hh:mm a")
                              .parse(b.dateTime)
                              .compareTo(DateFormat("MMM dd, yyyy, hh:mm a")
                                  .parse(a.dateTime)));
                      data = sortedNotes;
                      return Obx(() => Column(
                            children: [
                              ...List.generate(data.length, (index) {
                                Note note = data[index];
                                return showFavController.showFav.value == true
                                    ? Visibility(
                                        visible: note.isFavourite == 1,
                                        child: kNoteCard(note))
                                    : kNoteCard(note);
                              })
                            ],
                          ));
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Get.toNamed("/add_note")!.then((value) => setState(() {
                    i++;
                  }));
            },
            label: Icon(Icons.add)),
      ),
    );
  }

  Dismissible kNoteCard(Note note) {
    return Dismissible(
      onDismissed: (dis) async {
        await DatabaseHelper.deleteNote(note);
        customSnackbar(message: "Note Deleted Successfully");
      },
      key: ValueKey(note.id),
      child: GestureDetector(
        onTap: () {
          Get.to(() => AddNotesPage(
                    note: note,
                  ))!
              .then((value) => setState(() {
                    i++;
                  }));
        },
        child: Stack(
          children: [
            Card(
              color: Color(int.parse(
                      note.color.replaceAll("Color(", "").replaceAll(")", "")))
                  .withOpacity(1),
              child: Container(
                padding: EdgeInsets.all(10),
                width: Get.width,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      note.title,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: blackColor()),
                    ),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(note.description,
                            style: TextStyle(
                                color: blackColor(),
                                fontSize: 16,
                                fontWeight: FontWeight.w700))),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    note.dateTime,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  int i = 0;
}

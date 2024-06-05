import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notes_app_sql/constants/app_colors.dart';
import 'package:notes_app_sql/constants/custom_date_format.dart';
import 'package:notes_app_sql/constants/custom_padding.dart';
import 'package:notes_app_sql/constants/custom_snackbar.dart';
import 'package:notes_app_sql/models/notes_model.dart';
import 'package:notes_app_sql/services/database_helper.dart';
import 'package:notes_app_sql/widgets/custom_app_bar.dart';

class AddNotesPage extends StatefulWidget {
  final Note? note;
  const AddNotesPage({super.key, this.note});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  int isFavourite = 0;

  manageNote(int value) async {
    await DatabaseHelper.updateNote(Note(
        id: widget.note!.id,
        title: _titleController.text,
        description: _descriptionController.text,
        isFavourite: value,
        color: widget.note!.color,
        dateTime: customDateFormat(date: DateTime.now())));
    customSnackbar(
        message: value != 0
            ? "Note Added To Favourite Successfully"
            : "Note Removed From Favourite Successfully");
  }

  preText() {
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _descriptionController.text = widget.note!.description;
      isFavourite = widget.note!.isFavourite;
    }
  }

  @override
  void initState() {
    super.initState();
    preText();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(
              label: "Add Note",
              showLeading: true,
              action: [
                IconButton(
                    onPressed: () async {
                      if (isFavourite == 1) {
                        manageNote(0);
                        setState(() {
                          isFavourite = 0;
                        });
                      } else {
                        manageNote(1);
                        setState(() {
                          isFavourite = 1;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavourite == 0 ? greyColor() : Colors.redAccent,
                    ))
              ],
            )),
        body: SingleChildScrollView(
          child: customPadding(
            Column(
              children: [
                TextFormField(
                  validator: (val) {
                    if (val == '') {
                      return "Please add a title";
                    }
                    return null;
                  },
                  controller: _titleController,
                  decoration: InputDecoration(
                      labelText: "Title", border: OutlineInputBorder()),
                ),
                SizedBox(height: 30),
                TextFormField(
                  validator: (val) {
                    if (val == '') {
                      return "Please add a description";
                    }
                    return null;
                  },
                  controller: _descriptionController,
                  decoration: InputDecoration(
                      labelText: "Description", border: OutlineInputBorder()),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () async {
            if (_key.currentState!.validate()) {
              if (widget.note != null) {
                await DatabaseHelper.updateNote(Note(
                    id: widget.note!.id,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    isFavourite: widget.note!.isFavourite,
                    color: widget.note!.color,
                    dateTime: customDateFormat(date: DateTime.now())));
                Get.back();
                customSnackbar(message: "Note updated successfully");
              } else {
                Color color = randomColors();

                await DatabaseHelper.addNote(Note(
                    title: _titleController.text,
                    description: _descriptionController.text,
                    isFavourite: isFavourite,
                    color: color.toString(),
                    dateTime: customDateFormat(date: DateTime.now())));
                Get.back();
                customSnackbar(message: "Note added successfully");
              }
            }
          },
          child: Icon(Icons.check),
        ),
      ),
    );
  }
}

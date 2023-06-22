import 'package:database/database.dart';
import 'package:database/models/group.dart';
import 'package:flutter/material.dart';
import 'ViewGroup.dart';

class EditGroup extends StatefulWidget {
  final bool edit;
  final Group group;
  const EditGroup(this.edit, {super.key, required this.group});

  @override
  _NewScreemState createState() => _NewScreemState();
}

class _NewScreemState extends State<EditGroup> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController codeEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController personEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.edit == true) {
      nameEditingController.text = widget.group.name;
      codeEditingController.text = widget.group.code;
      descriptionEditingController.text = widget.group.description;
      personEditingController.text = widget.group.persons as String;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.edit ? "Edit Group" : "Crear Grupo"),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ViewGroup()),
                  ),
                );
              },
              child: Text('ver grupos'),
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 10),
                SizedBox(
                    height: kToolbarHeight,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: const Text('Bienvenido a grupo',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    )),
                FlutterLogo(
                  size: 100,
                ),
                const SizedBox(height: 30),
                textFormField(
                    nameEditingController,
                    "Name",
                    "Enter Name",
                    Icons.person_outline_outlined,
                    widget.edit ? widget.group.name : "a"),

                textFormField(
                    codeEditingController,
                    'Code',
                    "Enter Code",
                    Icons.lock_outline_rounded,
                    widget.edit ? widget.group.code : "c"),
                textFormField(
                    descriptionEditingController,
                    "Description",
                    "Enter Description",
                    Icons.email_outlined,
                    widget.edit ? widget.group.description : "d"),
                //textFormField(personEditingController,'Repeat Password', icon: Icons.lock_outline_rounded),

                ElevatedButton(
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    } else if (widget.edit == true) {
                      GroupDatabaseProvider.db.updateGroup(Group(
                          name: nameEditingController.text,
                          code: codeEditingController.text,
                          id: widget.group.id,
                          description: descriptionEditingController.text,
                          persons: []));
                      Navigator.pop(context);
                    } else {
                      await GroupDatabaseProvider.db.addGroupToDatabase(Group(
                          id: 0,
                          name: nameEditingController.text,
                          code: codeEditingController.text,
                          description: descriptionEditingController.text,
                          persons: []));
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Sign In',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ));
  }

  textFormField(TextEditingController t, String label, String hint,
      IconData iconData, String initialValue) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
        },
        controller: t,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            prefixIcon: Icon(iconData),
            hintText: hint,
            labelText: label,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}

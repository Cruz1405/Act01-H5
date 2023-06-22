import 'package:database/database.dart';
import 'package:database/models/group.dart';
import 'package:database/EditGroup.dart';
import 'package:flutter/material.dart';

class ViewGroup extends StatefulWidget {
  @override
  _ViewGroupPageState createState() => _ViewGroupPageState();
}

class _ViewGroupPageState extends State<ViewGroup> {
  @override
  void didUpdateWidget(ViewGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grupos'),
      ),
      body: FutureBuilder<List<Group>>(
        future: GroupDatabaseProvider.db.getAllGroup(),
        builder: (BuildContext context, AsyncSnapshot<List<Group>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Group item = snapshot.data![index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    //PersonDatabaseProvider.db.deletePersonWithId(item.id);
                  },
                  child: ListTile(
                    title: Text(item.name),
                    subtitle: Text(item.description),
                    leading: CircleAvatar(child: Text(item.id.toString())),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditGroup(
                                true,
                                group: item,
                              )));
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

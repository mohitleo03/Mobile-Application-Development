import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        body: ListView(
          children: [
            Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              endActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),
              child: const ListTile(title: Text('Slide me')),
            ),
            Slidable(
              startActionPane: const ActionPane(
                motion: ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {}),
                children: const [
                  SlidableAction(
                    flex: 2,
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: doNothing,
                    backgroundColor: Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),
              child: const ListTile(title: Text('Slide me')),
            ),
          ],
        ),
      ),
    );
  }
}

void doNothing(BuildContext context) {}

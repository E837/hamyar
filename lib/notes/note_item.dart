import 'package:flutter/material.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  final TextEditingController controller = TextEditingController();

  Widget showMultiplierButton(
      BuildContext context, String text, double height, double width,
      {bool isButton = true}) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius:
              isButton ? BorderRadius.circular(30) : BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.primary,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Theme.of(context).colorScheme.primary,
      elevation: 2,
      child: LayoutBuilder(
        builder: (context, constraints) => InkWell(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Note\'s title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const Spacer(),
                        const Text('01/12/22'),
                      ],
                    ),
                    Divider(
                      endIndent: constraints.maxWidth * 0.6,
                    ),
                    const Text(
                      'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem.',
                      // 'Lorem ipsum',
                      overflow: TextOverflow.fade,
                      maxLines: 6,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Icon(
                    Icons.delete_outline,
                    color: Theme.of(context).canvasColor,
                  ),
                ),
                onTap: () {},
              )
            ],
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

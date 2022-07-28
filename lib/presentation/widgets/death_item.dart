import 'package:breaking_bad/data/models/death.dart';
import 'package:breaking_bad/data/models/episode.dart';
import 'package:flutter/material.dart';

class DeathItem extends StatefulWidget {
  final Death death;

  const DeathItem({Key? key, required this.death}) : super(key: key);

  @override
  State<DeathItem> createState() => _DeathItemState();
}

class _DeathItemState extends State<DeathItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Container(
        color: Colors.grey.shade100,
        height: 150,
        child: Column(
          children: [
            Container(color: Colors.white,height: 75,
              width: double.infinity,
              child:  ListTile(
                title:  Text('Death ${widget.death.death}'),
                subtitle: Text('season ${widget.death.season}'),

              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            ListTile(
              title:  Text('${widget.death.lastWords}'),
              leading: Image.asset('images/death1.png'),
              subtitle: Text('cause : ${widget.death.cause}',maxLines: 1,overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}

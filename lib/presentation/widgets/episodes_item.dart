import 'package:breaking_bad/data/models/episode.dart';
import 'package:flutter/material.dart';

class EpisodesItem extends StatefulWidget {
  final Episode episode;

  const EpisodesItem({Key? key, required this.episode}) : super(key: key);

  @override
  State<EpisodesItem> createState() => _EpisodesItemState();
}

class _EpisodesItemState extends State<EpisodesItem> {
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
                title:  Text('Episodes ${widget.episode.episodeId}'),
                subtitle: Text('season ${widget.episode.season}'),
                trailing:  Checkbox(
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;

                      });
                    }),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey,
            ),
            ListTile(
              title:  Text('Episodes ${widget.episode.title}'),
              leading: Icon(Icons.text_snippet),
              subtitle: Text('${widget.episode.series}'),
            ),
          ],
        ),
      ),
    );
  }
}

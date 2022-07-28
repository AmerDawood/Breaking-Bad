class Episode {
 late int episodeId;
late String title;
late String season;
late String airDate;
  // List<String>? characters;
 late String episode;
 late String series;


  Episode.fromJson(Map<String, dynamic> json) {
    episodeId = json['episode_id'];
    title = json['title'];
    season = json['season'];
    airDate = json['air_date'];
    // characters = json['characters'].cast<String>();
    episode = json['episode'];
    series = json['series'];
  }

}
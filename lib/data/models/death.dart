class Death {
 late int deathId;
 late String death;
 late String cause;
 late String responsible;
 late String lastWords;
 late int season;
 late int episode;
 late int numberOfDeaths;



  Death.fromJson(Map<String, dynamic> json) {
    deathId = json['death_id'];
    death = json['death'];
    cause = json['cause'];
    responsible = json['responsible'];
    lastWords = json['last_words'];
    season = json['season'];
    episode = json['episode'];
    numberOfDeaths = json['number_of_deaths'];
  }


}
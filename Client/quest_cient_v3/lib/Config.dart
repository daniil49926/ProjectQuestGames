class Config {
  bool? firstEntry;
  Null? userName;
  Null? userMail;
  Null? userPassword;
  int? scores;
  List<String>? listOfDownloadedQuests;

  Config(
      {this.firstEntry,
      this.userName,
      this.userMail,
      this.userPassword,
      this.scores,
      this.listOfDownloadedQuests});

  Config.fromJson(Map<String, dynamic> json) {
    firstEntry = json['first_entry'];
    userName = json['user_name'];
    userMail = json['user_mail'];
    userPassword = json['user_password'];
    scores = json['Scores'];
    listOfDownloadedQuests = json['list_of_downloaded_quests'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_entry'] = this.firstEntry;
    data['user_name'] = this.userName;
    data['user_mail'] = this.userMail;
    data['user_password'] = this.userPassword;
    data['Scores'] = this.scores;
    data['list_of_downloaded_quests'] = this.listOfDownloadedQuests;
    return data;
  }
}
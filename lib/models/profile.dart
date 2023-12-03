class Profile {
  Profile();

  int theme = 0;
  String locale = 'system';

  Profile.fromJson(Map<String, dynamic> json)
    : theme = json['theme'],
      locale = json['locale'];

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'theme': theme,
        'locale': locale
      };
}
class Constant {
  static const apiKey = '236e1ac184df34848ef5d1c47080dee9';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';
  static const baseAvatarUrl = 'https://image.tmdb.org/t/p/w185';
  static const String avatarPlaceHolder =
      'https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049__480.png';
}

String getAvatarUrl(String? path) {
  if (path != null) {
    if (path.startsWith('/https://www.gravatar.com/avatar')) {
      return path.substring(1);
    } else {
      return Constant.baseAvatarUrl + path;
    }
  } else {
    return Constant.avatarPlaceHolder;
  }
}

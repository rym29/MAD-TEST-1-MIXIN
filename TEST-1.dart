// You are developing a music streaming application. Define an abstract class MediaItem
// representing various media items such as songs, albums, and playlists. Implement concrete classes
// Song, Album, and Playlist that extend the MediaItem class. Additionally, create an interface Playable
// with a method play() that must be implemented by all media items.
// Create a Logger mixin that provides logging functionality to classes in your application. The Logger
// mixin should include methods for logging debug, info, warning, and error messages. Implement this
// mixin in various classes throughout your application to enable logging functionality wherever
// needed.
// RHYTHM 21CSU079 fS-A
abstract class Playable {
  void play();
}

abstract class MediaItem {
  String title;
  String artist;

  MediaItem(this.title, this.artist);
  
}

mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

class Song extends MediaItem with Logger implements Playable {
  String album;

  Song(String title, String artist, this.album) : super(title, artist);

  void play() {
    print('Playing song: $title by $artist from album $album');
  }
}

class Album extends MediaItem with Logger implements Playable {
  List<Song> songs;

  Album(String title, String artist, this.songs) : super(title, artist);

  void play() {
    print('Playing album: $title by $artist');
    for (var song in songs) {
      song.play();
    }
  }
}

class Playlist extends MediaItem with Logger implements Playable {
  List<MediaItem> items;

  Playlist(String title, String artist, this.items) : super(title, artist);

  void play() {
    print('Playing playlist: $title by $artist');
    for (var itm in items) {
      itm.play();
    }
  }
}

void main() {
  var song1 = Song('Song 1', 'Art A', 'Al X');
  var album = Album('My Album', 'Art C', [song1]);
  var playlist = Playlist('My Plist', 'Admin', [song1, album]);

  album.play();
  playlist.play();
}

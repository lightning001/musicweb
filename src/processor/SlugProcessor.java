package processor;


public class SlugProcessor {
	public static String getSlugAlbumByUrl(String url) {
		String album = null;
		String s[] = url.split("/");
		if (s.length > 0) {
			album = s[s.length - 1];
		}
		return album;
	}
	public static String getSlugSongByUrl(String url) {
		String slug = null;
		String s[] = url.split("/");
		if (s.length > 0) {
			slug = s[s.length - 1];
		}
		return slug;
	}
	public static String getSlugPlaylistByUrl(String url) {
		String slug = null;
		String s[] = url.split("/");
		if (s.length > 0) {
			slug = s[s.length - 1];
		}
		return slug;
	}
	public static String getSlugSingerByUrl(String url){
		String slug = null;
		String s[] = url.split("/");
		if(s.length == 4 || s.length ==3)
			slug = s[2];
		return slug;
	}
	public static  String getSlugSingerType(String url){
		String slug = null;
		String s[] = url.split("/");
		if(s.length == 4)
			slug = s[3];
		return slug;
	}

	public static  String getSlugMyMusicType(String url){
		String slug = null;
		String s[] = url.split("/");
		if(s.length == 3)
			slug = s[2];
		return slug;
	}

	public static  String getSlugBXHPlayer(String url){
		String slug = null;
		String s[] = url.split("/");
		if(s.length == 4)
			slug = s[3];
		return slug;
	}
	public static String getParam(String url) {
		String slug = null;
		String s[] = url.split("/");
		if (s.length > 0) {
			slug = s[s.length - 1];
		}
		return slug;
	}

}

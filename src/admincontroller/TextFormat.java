package admincontroller;

public class TextFormat {
	public static String createKeyWord(String s) {
		StringBuffer sb = new StringBuffer();
		char[] chs = s.toLowerCase().toCharArray();
		for (char c : chs) {
			if (c == 'á' || c == 'à' || c == 'ả' || c == 'ã' || c == 'ạ' || c == 'ă' || c == 'ắ' || c == 'ằ' || c == 'ẳ'
					|| c == 'ẵ' || c == 'ặ' || c == 'â' || c == 'ấ' || c == 'ầ' || c == 'ẩ' || c == 'ẫ' || c == 'ậ')
				sb.append('a');
			else if (c == 'é' || c == 'è' || c == 'ẻ' || c == 'ẽ' || c == 'ẹ' || c == 'ê' || c == 'ế' || c == 'ề'
					|| c == 'ể' || c == 'ễ' || c == 'ệ')
				sb.append('e');
			else if (c == 'ì' || c == 'í' || c == 'ỉ' || c == 'ĩ' || c == 'ị')
				sb.append('i');
			else if (c == 'ó' || c == 'ò' || c == 'ỏ' || c == 'õ' || c == 'ọ' || c == 'ô' || c == 'ố' || c == 'ồ'
					|| c == 'ổ' || c == 'ỗ' || c == 'ộ' || c == 'ơ' || c == 'ớ' || c == 'ờ' || c == 'ở' || c == 'ỡ'
					|| c == 'ợ')
				sb.append('o');
			else if (c == 'ú' || c == 'ù' || c == 'ủ' || c == 'ũ' || c == 'ụ' || c == 'ư' || c == 'ừ' || c == 'ứ'
					|| c == 'ử' || c == 'ữ' || c == 'ự')
				sb.append('u');
			else if (c == 'ý' || c == 'ỳ' || c == 'ỷ' || c == 'ỹ' || c == 'ỵ')
				sb.append('y');
			else if (c == 'đ')
				sb.append('d');
			else if (c == ' ')
				sb.append('-');
			else
				sb.append(c);
		}
		return sb.toString();
	}

	public static String createSlug(String s, long n) {
		return createKeyWord(s) + "-" + n;
	}
}

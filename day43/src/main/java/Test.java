import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		String strStamp = String.valueOf(timestamp.getTime());

		
		Date date = new Date(Long.parseLong(strStamp)); // [타임 스탬프 값 문자열 형 변환]
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd kk:mm:ss"); // [Date 형식으로 변경 : 24 시간 포맷 형태]
		
		System.out.println(String.valueOf(sdf.format(date)));
	}

}

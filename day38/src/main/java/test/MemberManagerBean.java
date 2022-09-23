package test;

import java.util.ArrayList;

public class MemberManagerBean {
	ArrayList<MemberBean> datas = new ArrayList<MemberBean>(); 
	
	public boolean insert(MemberBean mb) {
		datas.add(mb);
		return true;
	}
	
	public ArrayList<MemberBean> selectAll(MemberBean mb) {
		return datas;
	}
	
	
}
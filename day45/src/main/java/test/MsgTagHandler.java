package test;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

// 핸들러 클래스를 만들고 싶음
// 핸들러 클래스가 어딘가에 존재함
// "상속"

public class MsgTagHandler extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException {
		JspWriter out=getJspContext().getOut();
		out.println("핸들러클래스기반으로 출력하는 메세지! :D");
	}
	// 시작 태그를 만나면 자동으로 호출되어 수행되는 메서드
}

package ctrl;

public class ActionForward {
	private String path; // 어디로 갈지
	private boolean redirect; // 어떻게 갈지

	public ActionForward() {
		
	}
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}
	
}

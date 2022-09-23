package test;

public class LoginBean {
   private String id;
   private String pw;
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   
   final String adminId="admin";
   final String adminPw="1234";
   // final이 붙은 변수들은 추후 DB의 데이터로 대체할예정!!!
   public boolean login() {
      if(id.equals(adminId) && pw.equals(adminPw)) {
         return true;
      }
      
      return false;
   }
}
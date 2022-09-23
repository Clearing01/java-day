<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>

<jsp:useBean id="test" class="test.Test" />
<h1><jsp:doBody /></h1>
<table border="${border}" bgcolor="${bgcolor}">
   <%
      for(String v:test.getDatas()){
   %>
      <tr>
         <td><%=v%></td>
      </tr>
   <%
      }
   %>
</table>
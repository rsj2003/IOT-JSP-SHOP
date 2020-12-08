<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>상품별 매출 현황</h3>
<table border="1">
	<tr>
		<td>카테고리 이름</td>
		<td>총 판매 금액</td>
		<td>판매 개수</td>
	</tr>
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "SELECT " +
                "        	C.NAME, " +
				"        	SUM(S.SALE_PRICE), " +
				"		 	SUM(S.AMOUNT) " +
                "    FROM " +
                "        SALE		S, " +
                "        CATEGORY	C, " +
                "        PRODUCT	P " +
                "    WHERE " +
                "        P.PRODUCT_ID = S.PRODUCT_ID AND " +
                "        P.CATEGORY_ID = C.CATEGORY_ID " +
                "	 GROUP BY " +
               	" 	 	C.CATEGORY_ID, C.NAME";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            %>
                <tr>
                    <td><% out.println(rs.getString(1));%></td>
                    <td><% out.println(rs.getInt(2));%></td>
                    <td><% out.println(rs.getInt(3));%></td>
                </tr>
            <%

        }
        stmt.close();
        conn.close();
    }
    catch (Exception e) {
        e.printStackTrace();
    }
%>
</table>
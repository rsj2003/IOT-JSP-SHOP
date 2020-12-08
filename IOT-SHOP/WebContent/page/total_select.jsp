<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<table border="1">
<%
    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection conn = DriverManager.getConnection
        ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
        Statement stmt = conn.createStatement();
        String query = "SELECT " +
                "        	S.SALE_ID, " +
                "        	P.NAME, " +
				"        	S.PURCHASE_DATE, " +
				"       	S.SALE_PRICE, " +
				"		 	S.AMOUNT " +
                "    FROM " +
                "        SALE		S, " +
                "        PRODUCT	P " +
                "    WHERE " +
                "        P.PRODUCT_ID = S.PRODUCT_ID " +
                "    ORDER BY " + 
                "        S.SALE_ID DESC";
        ResultSet rs = stmt.executeQuery(query);
        while (rs.next()) {
            %>
                <tr>
                    <td><% out.println(rs.getInt(1));%></td>
                    <td><% out.println(rs.getString(2));%></td>
                    <td><% out.println(rs.getString(3));%></td>
                    <td><% out.println(rs.getInt(4));%></td>
                    <td><% out.println(rs.getInt(5));%></td>
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
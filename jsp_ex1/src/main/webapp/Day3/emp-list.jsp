<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 500px;
	border-collapse: collapse;
	margin: 10px 0;
}

th, td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}

th {
	background-color: #ccc;
}
</style>
<body>
    <%@include file="../db.jsp"%>

    <%
    ResultSet rs = null;

    try {
        String sql = "SELECT E.EMPNO, E.ENAME, E.SAL, S.GRADE, E2.ENAME AS 팀장, D.DNAME " +
                     "FROM EMP E " +
                     "INNER JOIN EMP E2 ON E.MGR = E2.EMPNO " +
                     "INNER JOIN DEPT D ON D.DEPTNO = E.DEPTNO " +
                     "INNER JOIN SALGRADE S ON E.SAL BETWEEN LOSAL AND HISAL " +
                     "WHERE S.GRADE >= 1 " +
                     "ORDER BY S.GRADE DESC";

        rs = stmt.executeQuery(sql);

        out.println("<table border='1'>");
        out.println("<tr>");
        out.println("<th>사번</th>");
        out.println("<th>이름</th>");
        out.println("<th>급여</th>");
        out.println("<th>급여등급</th>");
        out.println("<th>팀장(사수)</th>");
        out.println("<th>부서명</th>");
        out.println("</tr>");

        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("EMPNO") + "</td>");
            out.println("<td>" + rs.getString("ENAME") + "</td>");
            out.println("<td>" + rs.getString("SAL") + "</td>");
            out.println("<td>" + rs.getString("GRADE") + "</td>");
            out.println("<td>" + rs.getString("팀장") + "</td>");
            out.println("<td>" + rs.getString("DNAME") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

    } catch (SQLException e) {
        out.println("오류 발생!");
    } 
    %>
</body>
</html>

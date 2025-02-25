<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp"%>
	
	시: <select onchange="fnSelectSi(this.value)">
		<option>:: 선택 ::</option>
	
	<%
		ResultSet rs = null;
		
		String paramsi = request.getParameter("paramsi");
		String query = "SELECT DISTINCT SI FROM AREA";
		rs = stmt.executeQuery(query);
		
		while (rs.next()) {
            String si = rs.getString("SI");
            String selected = si.equals(paramsi) ? "selected" : "";  // pramsi이 같아지는 순간에 selected에 담아라 
	%>
		<option value="<%= si %>"<%= selected %>><%= si %></option>
	<%
		}
	%>
      </select>  
         
      구: <select onchange="fnSelectGU(this.value, '<%=paramsi%>')">
		<option>:: 선택 ::</option>
	
	<%
		String paramGu = request.getParameter("paramGu");
		query = "SELECT DISTINCT GU FROM AREA WHERE SI ='" + paramsi + "' AND GU IS NOT NULL ";	
		rs = stmt.executeQuery(query);
		
		while (rs.next()) {
            String gu = rs.getString("GU");
            String selected = gu.equals(paramGu) ? "selected" : "";
	%>
		<option value="<%= gu %>"<%= selected %>><%= gu %></option>
	<%
		}
	%>
      </select>
      
      동: <select>
		<option>:: 선택 ::</option>	
	<%
		query = "SELECT DONG, NX, NY FROM AREA WHERE SI ='" + paramsi  +  "' AND GU = '" + paramGu  +"' " +  "AND DONG IS NOT NULL";
		
		rs = stmt.executeQuery(query);
		
		while (rs.next()) {
            String dong = rs.getString("DONG");
	%>
		<option value="<%= dong %>"><%= dong %></option>
	<%
		}
	%>
      </select>
  
</body>
</html>
<script>

	function fnSelectSi(value){
		console.log(value);
		location.href = "?paramsi=" + value;
		
	}
	
	function fnSelectGU(value, paramsi ){
		location.href = "?paramGu=" + value + "&paramsi=" + paramsi;
	}
	
	function fnApiCall(){
		var xhr = new XMLHttpRequest();
		var url = 'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst'; /*URL*/
		var queryParams = '?' + encodeURIComponent('serviceKey') + '='+
				'cxBy07XRhYnDF%2BRbsmPQxSSDxL2HcB0nyFsMLpGgpxHAcs95LwJO2XTE1V2XgYYohMpiCQ1NZJ801CTAuPrY2w%3D%3D'; 
		queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
		queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('JSON'); /**/
		queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent('20250225'); /**/
		queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('1000'); /**/
		queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent('55'); /**/
		queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent('125'); /**/
		xhr.open('GET', url + queryParams);
		xhr.onreadystatechange = function () {
		    if (this.readyState == 4) {
		        console.log('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
		    }
		};

		xhr.send('');
	}
	
</script>
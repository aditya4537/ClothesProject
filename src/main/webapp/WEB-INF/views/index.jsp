<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Clothes App</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Car | Index</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href='https://unpkg.com/css.gg@2.0.0/icons/css/remove.css'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<button type="button" id="fetch">Fetching</button>

	<script>
		$(document).ready(function() {
			$("#fetch").click(function() {
				$("#mainForm").hide();
				$("#showData").show("slow");
				$.get("/get", function(data) {
					/*  let realData = data.data;
					 let tRow = null;
					 for (let oneData of realData) {
					     tRow += "<tr><td>" + oneData.id + "</td><td>" + oneData.name + "</td><td>" + oneData.brand + "</td><td>" + oneData.color + "</td><td><i class=\"fa fa-trash-o\" onClick=\"deleteData(" + oneData.id + ")\" data-id=\"\"></i> | <i class=\"fa fa-trash-o\" onClick=\"editData(" + oneData.id + ", '" + oneData.name + "', '" + oneData.brand + "','" + oneData.color + "')\" data-id=\"\" ></i> </td>" + "</tr>";
					 }
					 $("#tableOne").html(tRow); */

					console.log(data);
				});
			});
		});
	</script>
</body>
</html>
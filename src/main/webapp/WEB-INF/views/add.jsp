<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<link href='https://unpkg.com/css.gg@2.0.0/icons/css/remove.css' rel='stylesheet'>
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
			integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<style>
			@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700;900&display=swap');

			*,
			body {
				font-family: 'Poppins', sans-serif;
				font-weight: 400;
				-webkit-font-smoothing: antialiased;
				text-rendering: optimizeLegibility;
				-moz-osx-font-smoothing: grayscale;
			}

			html,
			body {
				height: 100%;
				color: black;

			}

			.form-holder {
				display: flex;
				flex-direction: column;
				justify-content: center;
				align-items: center;
				text-align: center;
				min-height: 100vh;
			}

			.form-holder .form-content {
				position: relative;
				text-align: center;
				display: -webkit-box;
				display: -moz-box;
				display: -ms-flexbox;
				display: -webkit-flex;
				display: flex;
				-webkit-justify-content: center;
				justify-content: center;
				-webkit-align-items: center;
				align-items: center;
				padding: 60px;
			}

			.form-content .form-items {
				border: 3px solid black;
				padding: 40px;
				display: inline-block;
				width: 100%;
				min-width: 540px;
				-webkit-border-radius: 10px;
				-moz-border-radius: 10px;
				border-radius: 10px;
				text-align: left;
				-webkit-transition: all 0.4s ease;
				transition: all 0.4s ease;
			}

			.form-content h3 {
				color: black;
				text-align: left;
				font-size: 28px;
				font-weight: 600;
				margin-bottom: 5px;
			}

			.form-content h3.form-title {
				margin-bottom: 30px;
			}

			.form-content p {
				color: black;
				text-align: left;
				font-size: 17px;
				font-weight: 300;
				line-height: 20px;
				margin-bottom: 30px;
			}

			.form-content label,
			.was-validated .form-check-input:invalid~.form-check-label,
			.was-validated .form-check-input:valid~.form-check-label {
				color: black;
			}

			.form-content input[type=text],
			.form-content input[type=password],
			.form-content input[type=email],
			.form-content select {
				width: 100%;
				padding: 9px 20px;
				text-align: left;
				border: 0;
				outline: 0;
				border-radius: 6px;
				background-color: white;
				font-size: 15px;
				font-weight: 300;
				color: #8D8D8D;
				-webkit-transition: all 0.3s ease;
				transition: all 0.3s ease;
				margin-top: 16px;
			}

			.btn-primary {
				background-color: #6C757D;
				outline: none;
				border: 0px;
				box-shadow: none;
			}

			.btn-primary:hover,
			.btn-primary:focus,
			.btn-primary:active {
				background-color: #495056;
				outline: none !important;
				border: none !important;
				box-shadow: none;
			}

			.form-content textarea {
				position: static !important;
				width: 100%;
				padding: 8px 20px;
				border-radius: 6px;
				text-align: left;
				background-color: #fff;
				border: 0;
				font-size: 15px;
				font-weight: 300;
				color: #8D8D8D;
				outline: none;
				resize: none;
				height: 120px;
				-webkit-transition: none;
				transition: none;
				margin-bottom: 14px;
			}

			.form-content textarea:hover,
			.form-content textarea:focus {
				border: 0;
				background-color: #ebeff8;
				color: #8D8D8D;
			}

			.mv-up {
				margin-top: -9px !important;
				margin-bottom: 8px !important;
			}

			.invalid-feedback {
				color: #ff606e;
			}

			.valid-feedback {
				color: #2acc80;
			}
		</style>
	</head>

	<body>
		<header>
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<a class="navbar-brand" href="/home">Cloths</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" id="home" href="#">Home <span
									class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" id="add" href="#">Add</a>
						</li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Dropdown </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another
									action</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Something else here</a>
							</div>
						</li>
						<li class="nav-item"><a class="nav-link disabled" href="#" tabindex="-1"
								aria-disabled="true">Disabled</a></li>
					</ul>
					<form class="form-inline my-2 my-lg-0">
						<input id="search" class="form-control mr-sm-2" type="search" placeholder="Search"
							aria-label="Search">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
					</form>
				</div>
			</nav>
		</header>


		<main>
			<div id="home_content">
				<h1 class="">Clothes details</h1>
				<button id="previous">Previous</button>
				<button id="next">Next</button>
				<button id="pdf" name="export">Export pdf</button>
				<button id="xls" name="export">Export excel</button>

				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th id="name_field" scope="col">Name</th>
							<th scope="col">Size</th>
							<th scope="col">Color</th>
							<th scope="col">Category</th>
							<th scope="col">Price</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>

			<div class="form-body" id="form">
				<div class="row">
					<div class="form-holder">
						<div class="form-content">
							<div class="form-items">
								<h3 id="add_show">Add Cloth</h3>
								<h3 id="update_show">Update Cloth</h3>
								<p>Fill in the data below.</p>
								<form class="requires-validation" novalidate>

									<div class="col-md-12">
										<input class="form-control" id="name" type="text" name="name"
											placeholder="Cloth Name" required>
										<div class="invalid-feedback">name field cannot be blank!</div>
									</div>

									<div class="col-md-12">
										<input class="form-control" id="category" type="text" name="category"
											placeholder="Category" required>
										<div class="invalid-feedback">Category field cannot be
											blank!</div>
									</div>

									<div class="col-md-12">
										<select class="form-select mt-3" name="size" id="size" required>
											<option value="">Size</option>
											<option id="small" value="s">Small</option>
											<option id="medium" value="m">Medium</option>
											<option id="large" value="l">Large</option>
										</select>
										<div class="valid-feedback">You selected a position!</div>
										<div class="invalid-feedback">Please select a position!</div>
									</div>


									<div class="col-md-12">
										<input class="form-control" type="text" id="price" name="price"
											placeholder="Price" required>
										<div class="invalid-feedback">Price field cannot be
											blank!</div>
									</div>


									<div class="col-md-12 mt-3">
										<label class="mb-3 mr-1" for="color">Color: </label> <input type="radio"
											class="btn-check" name="color" value="blue" id="blue" autocomplete="off"
											required> <label class="btn btn-sm btn-outline-secondary"
											for="blue">Blue</label>

										<input type="radio" class="btn-check" name="color" value="black" id="black"
											autocomplete="off" required>
										<label class="btn btn-sm btn-outline-secondary" for="black">black</label>

										<input type="radio" class="btn-check" name="color" value="white" id="white"
											autocomplete="off" required>
										<label class="btn btn-sm btn-outline-secondary" for="white">White</label>
										<div class="invalid-feedback mv-up">Please select a
											Color!</div>
									</div>

									<div class="form-button mt-3">
										<button id="submit" type="submit" class="btn btn-primary">Submit</button>
										<button id="update" type="submit" class="btn btn-primary">Update</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</main>

		<footer>
			<hr>
			<div>Copyrights@2024</div>
			<hr>
		</footer>

		<script>
			$(document).ready(function () {
				$('#form').hide();
				$('#add').click(function () {
					$('#home_content').hide('slow');
					$('#form').show('slow');
					$('#add_show').show();
					$('#update_show').hide();
					$('#update').hide();
				})
				$('#home').click(function () {
					$('#form').hide('slow');
					$('#home_content').show('slow');
				})

				// export data as pdf or excel
				$('button[name="export"]').click(function () {
					var format = $(this).attr("id");
					var uri = "/report/" + format;

					// $.get({
					// 	url: uri,
					// 	success: function (data) {
					// 		swal("Exported Successfully!", "File saved at Path: " + data, "success");
					// 		window.open(data, "_blank");

					// 		getAllData(0, 10);
					// 	},
					// 	error: function () {
					// 		swal("Sorry!", "Some error has occurred", "error");
					// 	}

					// })

					$.ajax({
						url: uri,
						method: 'GET',
						xhrFields: {
							responseType: 'blob'
						},
						success: function (data) {
							var a = document.createElement('a');
							var url = window.URL.createObjectURL(data);
							a.href = url;
							a.download = 'clothes.' + format; // You can set the filename here
							document.body.append(a);
							a.click();
							a.remove();
							window.URL.revokeObjectURL(url);
							swal("Exported Successfully!", "File saved successfully", "success");
							getAllData(0, 10);
						},
						error: function () {
							swal("Sorry!", "Some error has occurred", "error");
						}
					});
				})

				// var elementIds = new Set();
				// $('#get_clothes').click(function () {
				// 	$(this).hide();
				// 	$.get("/get/" + offset + '/' + pagSize, function (data, status) {
				// 		console.log("Request successful.", status)
				// 		console.log(data);
				// 		// if (!elementIds.has(element.clothId)) {
				// 			var realData = data.response.content;
				// 			for (const element of realData) {
				// 				var tbody = $('table tbody');
				// 				var rowData = $('<tr><td>' + element.clothId + '</td><td>' + element.clothName + '</td><td>' + element.clothSize + '</td><td>' + element.color + '</td><td>' + element.category + '</td><td>' + element.price + '</td></tr>');
				// 				tbody.append(rowData);

				// 				// elementIds.add(element.clothId);
				// 			}
				// 			console.log("Data fetched successfully.")
				// 		// }
				// 	})
				// })



				var offset = 0;
				var pageSize = 10;
				getAllData(offset, pageSize);


				$('#next').click(function () {
					offset += 1;
					$.get("/get/" + offset + '/' + pageSize, function (data, status) {
						console.log("Request successful.", status);

						var realData = data.response.content;

						if (realData.length > 0) {
							$('table tbody').empty();
							addRows(realData);
							console.log("Data fetched successfully.");
						} else {
							offset -= 1;
							swal("Ohh! Sorry", "There is no next page", "error");
						}

					});
				});

				$('#previous').click(function () {
					offset -= 1;
					if (offset >= 0) {


						$.get("/get/" + offset + '/' + pageSize, function (data, status) {

							console.log("Request successful.", status);
							var realData = data.response.content;
							$('table tbody').empty();
							addRows(realData);
							console.log("Data fetched successfully.");
						});
					} else {
						offset += 1;
						swal("Ohh! Sorry", "This is the first page!", "error");
					}
				});


				$('#name_field').click(function () {
					console.log(offset, pageSize)
					$.get("/get/" + offset + "/" + pageSize + "/clothName", function (data, status) {
						console.log("Request successful.", status)
						$("table tbody").empty();
						for (const element of data.response.content) {
							var tbody = $('table tbody');
							var rowData = $('<tr><td>' + element.clothId + '</td><td>' + element.clothName + '</td><td>' + element.clothSize + '</td><td>' + element.color + '</td><td>' + element.category + '</td><td>' + element.price + '</td></tr>');
							tbody.append(rowData);
						}
						console.log("Data fetched successfully.")
					})
				})

				$('#submit').click(function () {
					event.preventDefault();

					var name = $("#name").val();
					var ccategory = $("#category").val();
					var size = $("#size").val();
					var cprice = $("#price").val();
					var ccolor = $('input[name="color"]:checked').val();

					var postData = {
						clothName: name,
						clothSize: size,
						color: ccolor,
						category: ccategory,
						price: cprice
					}

					$.post({
						url: "/add",
						contentType: 'application/json',
						data: JSON.stringify(postData),
						success: function (response) {
							console.log("Added successfully!", response)
							swal("Data added successfully!", response, "success");
							var name = $("#name").val('');
							var ccategory = $("#category").val('');
							var size = $("#size").val('');
							var cprice = $("#price").val('');
							var ccolor = $('input[name="color"]:checked').val('');
						},
						error: function (error) {
							console.log("Error: ", error)
							swal("Ohh! Sorry", error, "error");
						}
					})
					/* 
					 $.ajax({
					 type: "POST",
					 url: "/add",
					 contentType: 'application/json',
					 data: JSON.stringify(postData),
					 success: function (data, status) {
					 console.log(data.message);
					 }
					 });  */
				});

			});

			$("#search").keyup(function () {
				if ($(this).val() != '') {
					console.log($(this).val());
					$.get({
						url: "/search?sq=" + $(this).val(),
						success: function (data) {
							$('table tbody').empty();
							addRows(data);
							console.log("Fetched the results.");
						},
						error: function (error) {
							console.log("Some error occurred!", error);
						}
					})
				} else {
					getAllData(0, 10);
				}
			})

			function addRows(realData) {
				for (const element of realData) {
					var tbody = $('table tbody');
					var rowData = $('<tr><td>'
						+ element.clothId
						+ '</td><td>'
						+ element.clothName
						+ '</td><td>'
						+ element.clothSize
						+ '</td><td>'
						+ element.color
						+ '</td><td>'
						+ element.category
						+ '</td><td>'
						+ element.price
						+ '</td><td><button onclick="updateCloth('
						+ element.clothId
						+ ',\''
						+ element.clothName
						+ '\',\''
						+ element.clothSize
						+ '\',\''
						+ element.color
						+ '\',\''
						+ element.category
						+ '\','
						+ element.price
						+ ')">Edit</button> | <button onclick="deleteCloth('
						+ element.clothId
						+ ')">Delete</button></td></tr>'
					);
					tbody.append(rowData);
				}
			}

			function getAllData(offset, pageSize) {
				$('#form').hide();
				$('#home_content').show();
				$.get("/get/" + offset + '/' + pageSize, function (data, status) {
					console.log("Request successful.", status);

					var realData = data.response.content;

					if (realData.length > 0) {
						$('table tbody').empty();
						addRows(realData);
						console.log("Data fetched successfully.");
					} else {
						alert("No more records available.");
					}

				});
			}

			var currentClothId = null;

			$('#update').click(function () {
				event.preventDefault();
				var name = $("#name").val();
				var ccategory = $("#category").val();
				var size = $("#size").val();
				var cprice = $("#price").val();
				var ccolor = $('input[name="color"]:checked').val();

				var postData = {
					clothId: currentClothId,
					clothName: name,
					clothSize: size,
					color: ccolor,
					category: ccategory,
					price: cprice
				}

				$.post({
					url: "/add",
					contentType: 'application/json',
					data: JSON.stringify(postData),
					success: function (response) {
						swal("Updated successfully!", response, "success");
						getAllData(0, 10);
					},
					error: function (error) {
						console.log("Error: ", error)
					}
				})
			})

			function updateCloth(id, name, size, color, category, price) {
				console.log(id, name, size, color, category, price);
				$('#home_content').hide();
				$('#form').show(function () {
					$('#add_show').hide();
					$('#update_show').show();
					$("#submit").hide();
					$("#update").show();

					$("#name").val(name);
					$("#size").val(size).prop("selected", true);
					$("#" + color).prop("checked", true);
					$("#category").val(category);
					$("#price").val(price);

					currentClothId = id;
				});
			}


			function deleteCloth(id) {
				console.log("Id from function", id)
				$.ajax({
					type: "DELETE",
					url: "/delete/" + id,
					contentType: 'application/json',
					success: function (data, status) {
						alert("Deleted successfully!");
						console.log(data.message);
						getAllData(0, 10);
					}
				});

			}
		</script>

	</body>

	</html>
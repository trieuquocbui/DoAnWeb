<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Biểu đồ doanh thu</title>
	
	
</head>
<body>
	<div class="content-wrapper">
		<section class="content">
			<div class="container-fluid">
				<div class="row">

					<div class="col col-sm-9 m-4 ">
						
							<h1 class="text-center">Biểu đồ doanh thu</h1>
							<canvas id="myChart"></canvas>
						
					</div>
				</div>

			</div>
	</div>
	</section>

	</div>


	<script>
		// Lấy thẻ canvas để vẽ biểu đồ
		var ctx = document.getElementById('myChart').getContext('2d');

		// Tạo một đối tượng biểu đồ
		var myChart = new Chart(ctx, {
			type : 'bar', // Loại biểu đồ cột
			data : {
				labels : [ 'Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4',
						'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9',
						'Tháng 10', 'Tháng 11', 'Tháng 12' ], // Nhãn trục x
				datasets : [ {
					label : 'Doanh thu', // Nhãn dữ liệu
					data : [ 2000, 2500, 3000, 3500, 4000, 2080, 2900, 3880,
							1900, 4900, 3300, 789 ], // Dữ liệu
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)',
							'rgba(255, 206, 86, 0.2)',
							'rgba(75, 192, 192, 0.2)',
							'rgba(153, 102, 255, 0.2)',
							'rgba(155, 99, 132, 0.2)',
							'rgba(44, 162, 235, 0.2)',
							'rgba(55, 206, 86, 0.2)',
							'rgba(45, 192, 192, 0.2)',
							'rgba(3, 102, 255, 0.2)', 'rgba(25, 99, 132, 0.2)',
							'rgba(126, 162, 235, 0.2)', ],

					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)',
							'rgba(75, 192, 192, 1)', 'rgba(153, 102, 255, 1)',
							'rgba(155, 99, 132, 1)', 'rgba(44, 162, 235, 1)',
							'rgba(55, 206, 86, 1)', 'rgba(45, 192, 192, 1)',
							'rgba(3, 102, 255, 1)', 'rgba(25, 99, 132, 1)',
							'rgba(126, 162, 235, 1)', ],
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					yAxes : [ {
						ticks : {
							beginAtZero : true
						}
					} ]
				}
			}
		});
	</script>

				
	
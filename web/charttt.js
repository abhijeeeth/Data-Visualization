		var years = <%=new Gson().toJson(years)%>;
		var lmvCounts = <%=new Gson().toJson(lmvCounts)%>;
		var motorcycleCounts = <%=new Gson().toJson(motorcycleCounts)%>;
		var heavyVehicleCounts = <%=new Gson().toJson(heavyVehicleCounts)%>;

		var ctx = document.getElementById('myChart').getContext('2d');
		var myChart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: years,
		        datasets: [{
		            label: 'LMV',
		            data: lmvCounts,
		            backgroundColor: 'rgba(255, 99, 132, 0.2)',
		            borderColor: 'rgba(255,99,132,1)',
		            borderWidth: 1
		        }, {
		            label: 'Motorcycle',
		            data: motorcycleCounts,
		            backgroundColor: 'rgba(54, 162, 235, 0.2)',
		            borderColor: 'rgba(54, 162, 235, 1)',
		            borderWidth: 1
		        }, {
		            label: 'Heavy Vehicles',
		            data: heavyVehicleCounts,
		            backgroundColor: 'rgba(255, 206, 86, 0.2)',
		            borderColor: 'rgba(255, 206, 86, 1)',
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero:true
		                }
		            }]
		        }
		    }
		});
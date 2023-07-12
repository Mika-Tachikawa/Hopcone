$(document).on('turbolinks:load', function() { 
  if (window.gon != null && $('#myChart').length) {
    var hoppy = gon.hoppy;
    var acidity = gon.acidity;
    var sweetness = gon.sweetness;
    var ctx = document.getElementById("myChart");

    new Chart(ctx, {
      type: 'radar', 
      data: {
        labels: ["苦", "酸", "甘"], 
        datasets: [{
          label: '味のバランス', 
          backgroundColor: "rgba(255,226,0,0.45)", 
          borderColor: "rgba(255,169,0,1)", 
          data: [hoppy,acidity,sweetness] 
        }],
      },
      options: {
        scales: {
          r: {
            suggestedMin: 0,
            suggestedMax: 10
          }
        },
        scale: {
          //stepSize: 1
        }
      }
    });
  }
});
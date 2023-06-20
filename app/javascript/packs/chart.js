$(document).on('turbolinks:load', function(){ //ページを読み込んだらjs発火


 if (window.gon != null && $('#myChart').length) {

  var acidity = gon.acidity; //gonを使った変数をjsで変数に代入

  var bitterness = gon.hoppy;

  var sweetness = gon.sweetness;


  //console.log("ここまでは動いている？？？？");

  var ctx = document.getElementById("myChart"); //html内のcanvasタグ


  //console.log(ctx); //上にちゃんと値が入っているか

  new Chart(ctx, {

  type: 'radar', //レーダーチャートを指定

  data: {

  labels: ["酸", "苦", "甘"], //5角形の頂点の名前

  datasets: [{

  label: '味のバランス', //レーダーチャートの表すもの

  backgroundColor: "rgba(0,0,80,0.4)", //グラフの色

  borderColor: "rgba(0,0,80,1)", //レーダーの線の色

  data: [acidity,bitterness,sweetness] //実際に引っ張るデータの変数

  }],

  },

  options: {

  scale: {

  pointLabels: {

  fontColor: "green" //5角形の頂点の名前の色

  },

  ticks: {

  min: 0, //minimun（チャートの中心)

  max: 5, //maximum (五角形の頂点)

  stepSize: 1 //1目盛りの区切り

  }

  }

  }

  });
 }

 });
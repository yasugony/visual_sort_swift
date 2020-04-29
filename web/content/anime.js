
var x;
var y;
var r;
var interval;

function draw() {
  const drawSecond = 1;
  
  var ii = 0;
  interval = setInterval(function(){
    var coordinates = datas[ii].split(',');
    drawCore(coordinates)
    if(ii == datas.length - 1){
      return;
    }
    ii++;
  }, drawSecond);

   var clr = document.getElementById('clr');
   clr.removeAttribute("disabled");
   var exe = document.getElementById('exe');
   exe.setAttribute("disabled","disabled");
}

function clears() {
  if(interval != null) {
      clearInterval(interval)
      interval=null;
  }

  var coordinates = datas[0].split(',');
  drawCore(coordinates)

  var exe = document.getElementById('exe');
  exe.removeAttribute("disabled");

  var clr = document.getElementById('clr');
  clr.setAttribute("disabled","disabled");

}

function init(){
  var canvas = document.getElementById('canvas');
  var ctx = canvas.getContext('2d');
  var coordinates = datas[0].split(',');
  x = canvas.width/coordinates.length;
  r = x/2;
  y = canvas.height/coordinates.length;

  clears()
}

function drawCore(coordinates) {
  var canvas = document.getElementById('canvas');
  var ctx = canvas.getContext('2d');
  ctx.clearRect(0,0,canvas.width,canvas.height);
  ctx.beginPath();
  for(var jj = 0; jj < coordinates.length; jj++){
    ctx.arc(jj*x + r, canvas.height - coordinates[jj]*y + r, r, 0, Math.PI*2, false);
    ctx.moveTo(1, 1);
  }
  ctx.fill();
}

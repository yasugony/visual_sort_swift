var x;
var y;
var r;
var interval;
var currentDatas = [];

function draw() {
  const drawSecond = 1;
  
  var currentDiffIndex = 0;
  interval = setInterval(function(){
    if(currentDiffIndex == diffs.length){
      return;
    }

    //差分の値を入れ替え
    var currentDiff = diffs[currentDiffIndex].split(',');

    if(currentDiff[2] == 'X') {
      var tempData = currentDatas[currentDiff[0]];
      currentDatas[currentDiff[0]] = currentDatas[currentDiff[1]];
      currentDatas[currentDiff[1]] = tempData;
    } else if( currentDiff[2] == 'I') {
      currentDatas[currentDiff[0]] = currentDatas[currentDiff[1]];
    } else if( currentDiff[2] == 'W') {
      currentDatas[currentDiff[0]] = currentDiff[1];
    }

    drawCore(currentDatas)
    currentDiffIndex++;
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

  //データを初期化
  currentDatas = datas.slice(0, datas.length);;
  drawCore(currentDatas)

  var exe = document.getElementById('exe');
  exe.removeAttribute("disabled");

  var clr = document.getElementById('clr');
  clr.setAttribute("disabled","disabled");

}

function init(){
  var canvas = document.getElementById('canvas');
  var length = datas.length;
  x = canvas.width/length;
  r = x/2;
  y = canvas.height/length;

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

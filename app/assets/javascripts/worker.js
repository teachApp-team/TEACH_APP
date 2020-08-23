var timerStart = true;
onmessage = function(data1) {
function myTimer(d0){
  if (data1.data != "00:00:00" ) {
    console.log(data1)
    console.log(Number(data1.data.slice(-2)))
    console.log(Number(data1.data.slice(-4,-2)))
    console.log(Number(data1.data.slice(-6,-4)))
    console.log("一時停止時間を追加していきます")
   // get current time
   var d=(new Date()).valueOf();
   // calculate time difference between now and initial time
   var diff = d-d0+Number(data1.data.slice(-2))*1000+Number(data1.data.slice(-4,-2))*60*1000+Number(data1.data.slice(-6,-4))*60*60*1000;
   // calculate number of minutes
   var hours = Math.floor(diff/1000/60/60);
   var minutes = Math.floor(diff/1000/60)-hours*60;
  // calculate number of seconds
   var seconds = Math.floor(diff/1000)-minutes*60-hours*60*60;
  //  var myVar = null;
   hours = hours.toString();
   if (hours.length == 1){
      hours = "0"+hours;
   }
   // if number of minutes less than 10, add a leading "0"
   minutes = minutes.toString();
   if (minutes.length == 1){
      minutes = "0"+minutes;
   }
   // if number of seconds less than 10, add a leading "0"
   seconds = seconds.toString();
   if (seconds.length == 1){
      seconds = "0"+seconds;
   }
   // return output to Web Worker
   postMessage(hours+":"+minutes+":"+seconds);
  }
}
if (timerStart){
   var myVar = null;
   // get current time
   var d0=(new Date()).valueOf();
   // repeat myTimer(d0) every 100 ms
   myVar=setInterval(function(){myTimer(d0)},100);
   // timer should not start anymore since it has been started
   timerStart = false;
  }
}
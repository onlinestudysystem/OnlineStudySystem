
 window.onload = function(){
    var oLeft = document.getElementById("left");
    var oRight = document.getElementById("right");

    var oWarp = document.getElementById("imgWarp");
    var aImg = oWarp.getElementsByTagName("img");
    var aEm = document.getElementsByTagName("em"); 
    var i = 5;
    btn = true;
    oLeft.onclick = function(){
     clearInterval(autoTimer);
     if(btn){ 
      btn=false;
      fnAutoLeft();
     }
    };
    function fnAutoLeft(){
     var a = i % 5;
     i-=1;
     var b = i % 5; 
     startOpacMove(aImg[a],0,aImg[b],100);
     setStyle(b);
    }

    oRight.onclick = function(){
      if(btn){ //单位时间内只能触发一次元素的显示隐藏
      clearInterval(autoTimer);
      btn=false;
      fnAutoRight();
      }
    };
    var count =0;
    function fnAutoRight(){
     var a = i % 5;
     i+=1;
     var b = i % 5;
     
     startOpacMove(aImg[a],0,aImg[b],100); 
     setStyle(b);
     if(i==10){
      i=5;

      for(var j = 0;j<aImg.length;j++){
       if(j==0){
        aImg[0].style.cssText ="opacity: 1; z-index: 5; display: block;";
       }
       else{
        aImg[j].style.cssText ="opacity: 0; z-index: 0; display: none;";
       }
      }
     }
    }
 
    var autoTimer = setInterval(fnAutoRight,5000);
    
    function setStyle(a){
     for(var i=0;i<aEm.length;i++){
       aEm[i].className="";
     } 
     aEm[a].className="active";
    }
   }

   function startOpacMove(obj1,tag1,obj2,tag2)
 { 
  var iCur1 = 0;
  var iCur2 = 0; 
  var iTimer = null;
  var iSpeed1 = -2;
  var iSpeed2 = 2;
  clearInterval(iTimer); 
  iTimer = setInterval(function(){
 
   var iBtn = true;
 
   iCur1 = css(obj1,'opacity')*100;
   iCur2 = css(obj2,'opacity')*100;
   iCur1 = Math.floor(iCur1);
   iCur2 = Math.floor(iCur2); 
 
   if(iCur1 != tag1 && iCur2 != tag2){
    iBtn = false;
     
    obj1.style.opacity = (iCur1+iSpeed1)/100;
    // console.log("隐藏元素时候的透明度值:"+(iCur1+iSpeed1)/100);
    obj1.style.filter = 'alpha(opacity='+(iCur1+iSpeed1)+')';
    obj1.style.zIndex = 0;
     
    obj2.style.opacity = (iCur2+iSpeed2)/100;
    obj2.style.filter = 'alpha(opacity='+(iCur2+iSpeed2)+')';
    obj2.style.zIndex = 5;
    obj2.style.display ="block";
   }
 
   if(iBtn){
    clearInterval(iTimer);
    obj1.style.display ="none";
    obj1.style.opacity =0;
    obj2.style.opacity =1; 
    btn = true;
   }
  },10);
}
     
function css(obj,attr){
 if(obj.currentStyle){ //当前浏览器下存在currentStyle属性
  return obj.currentStyle[attr];
 }else{
  return getComputedStyle(obj,false)[attr];
 }
} 

 $(document).ready(function () {
     $("#valid-a").click(function () {
         if($(this).attr("class")=="a-noneActive"){
            $(this).attr("class","a-Active");
             $("#invalid-a").attr("class","a-noneActive");
             $("#decrease-a").attr("class","a-noneActive");
             $("#forth-div-ul-valid").css("display","block");
             $("#forth-div-ul-decrease").css("display","none")
             $("#forth-div-ul-invalid").css("display","none");
         }

     });
     $("#invalid-a").click(function () {
         if($(this).attr("class")=="a-noneActive") {
             $(this).attr("class","a-Active");
             $("#valid-a").attr("class","a-noneActive");
             $("#decrease-a").attr("class","a-noneActive");
             $("#forth-div-ul-valid").css("display","none");
             $("#forth-div-ul-decrease").css("display","none");
             $("#forth-div-ul-invalid").css("display","block");
         }
     });
     $("#decrease-a").click(function () {
         if($(this).attr("class")=="a-noneActive") {
             $(this).attr("class","a-Active");
             $("#valid-a").attr("class","a-noneActive");
             $("#invalid-a").attr("class","a-noneActive");
             $("#forth-div-ul-decrease").css("display","block");
             $("#forth-div-ul-valid").css("display","none");
             $("#forth-div-ul-invalid").css("display","none");

         }
     });



 });
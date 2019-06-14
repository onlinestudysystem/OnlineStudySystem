function goSearch(){
    var address="good.do"
    if($("#searchGoodsText").val()=="请输入关键字") {
        location.href ="#";
    }
    else{
        var search=$("#searchGoodsText").val();
        var require=$("#require").val();
        location.href = address+"?search="+search+"&require="+require+"&action=queryGoods";
    }
}





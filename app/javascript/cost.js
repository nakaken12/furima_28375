window.addEventListener("turbolinks:load", function(){
  document.getElementById("item-price").onchange = func1;

  function func1(){

    const price = document.getElementById("item-price").value;
    const fee = Math.round( price / 10 );
    const benefit = price - fee;

    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = fee
    
    const profit = document.getElementById("profit")
    profit.innerHTML = benefit

  }
})
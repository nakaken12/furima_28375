window.addEventListener("load", function(){

  const pullDownButton = document.getElementById("parent-brand-list");
  const pullDownParents = document.getElementById("brand-show-lists");
  const brand = document.getElementById("brand-list");

  pullDownButton.addEventListener('mouseover', function(){
    brand.setAttribute("style", "color: #3ccace;");
  })

  pullDownButton.addEventListener('mouseout', function(){
    brand.removeAttribute("style", "color: #3ccace;");
  })

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display: block;");
  })

  pullDownButton.addEventListener("mouseout", function(){
    pullDownParents.setAttribute("style", "display: none;");
  })

});
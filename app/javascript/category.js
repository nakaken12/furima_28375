window.addEventListener('load', function(){

  const pullDownButton = document.getElementById("category-lists");
  const pullDownParents = document.getElementById("show-lists");
  const category = document.getElementById("category-list");

  pullDownButton.addEventListener('mouseover', function(){
    category.setAttribute("style", "color: #3ccace;");
  })

  pullDownButton.addEventListener('mouseout', function(){
    category.removeAttribute("style", "color: #3ccace;");
  })

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display:block;");
  })

  pullDownButton.addEventListener("mouseout", function(){
    pullDownParents.setAttribute("style", "display: none;");
  })
});



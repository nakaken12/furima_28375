window.addEventListener('load', function(){

  // const pullDownButton = document.getElementById("category-list");
  // const HTML = `
  // <ul id="show-lists", class="show-lists">
  //   <li id="pull-down-list", class="pull-down-list">レディース</li>
  //   <li class="pull-down-list">メンズ</li>
  //   <li class="pull-down-list">ベビー・キッズ</li>
  //   <li class="pull-down-list">インテリア・住まい・小物</li>
  //   <li class="pull-down-list">本・音楽・ゲーム</li>
  //   <li class="pull-down-list">おもちゃ・ホビー・グッズ</li>
  //   <li class="pull-down-list">家電・スマホ・カメラ</li>
  //   <li class="pull-down-list">スポーツ・レジャー</li>
  //   <li class="pull-down-list">ハンドメイド</li>
  //   <li class="pull-down-list">その他</li>
  // </ul>`  

  // pullDownButton.addEventListener('mouseover', function(){
  //   const parentForm = document.getElementById("category-list");
  //   parentForm.insertAdjacentHTML("afterbegin", HTML);

  //   pullDownButton.addEventListener('mouseout', function(){
  //     document.getElementById("show-lists").remove();
    
  //   });
   
  // });

  const pullDownButton = document.getElementById("category-list");
  const pullDownParents = document.getElementById("show-lists");
  const pullDownList = document.getElementsByClassName("pull-down-list");

  pullDownButton.addEventListener('mouseover', function(){
    pullDownParents.setAttribute("style", "display:block;");
  })
  pullDownButton.addEventListener("mouseout", function(){
    console.log("mouseout")
    // pullDownParents.removeAttribute("style", "display:block;");
    pullDownParents.setAttribute("style", "display:none;");
  })
});



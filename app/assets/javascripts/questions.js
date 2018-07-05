var tabcontent = document.getElementsByClassName("stabcontent");
 
function init() {
  for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
      console.log(tabcontent[i]);
  }
}

// set default
$(document).ready(function(){
  init();
  tabcontent[0].style.display = "block";
});

function openTab(evt, name) {
  var i, tablinks;
  init();

  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  document.getElementById(name).style.display = "block";
  evt.currentTarget.className += " active";
}
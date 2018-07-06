var tabcontent = document.getElementsByClassName("stabcontent");
var tablinks = document.getElementsByClassName("tablinks");
 
function init() {
  for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
  }
  
  for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
}

// set default
$(document).ready(function(){
  init();
  tabcontent[0].style.display = "block";
});

function openTab(evt, name) {
  var i;
  init();

  document.getElementById(name).style.display = "block";
  evt.currentTarget.className += " active";
}
var htmlElem = document.querySelector('html');


var bgcolorForm = document.getElementById('bgcolor');


if(!localStorage.getItem('bgcolor')) {
  populateStorage();
} else {
  setStyles();
}



function populateStorage() {
  localStorage.setItem('bgcolor', document.getElementById('bgcolor').value);

}

function setStyles() {
  var currentColor = localStorage.getItem('bgcolor');

  document.getElementById('bgcolor').value = currentColor;

  htmlElem.style.backgroundColor = '#' + currentColor;

}


bgcolorForm.onchange = populateStorage;
document.addEventListener("turbolinks:load", function () {
  var bar = document.querySelector(".progress-bar");

  if (bar) {
    setWidth();
  }
});

function setWidth() {
  var bar = document.querySelector(".progress-bar");
  var width = bar.dataset.width;

  bar.style.width = `${width}%`;
  bar.textContent = `${width}%`;
}

document.addEventListener('turbolinks:load', function () {
  var cards = document.querySelectorAll(".card-checkbox")
  console.log(cards)

  if (cards) {
    for (var i = 0; i <= cards.length - 1; i++) {
      cards[i].addEventListener('click', toggleCheckbox)
      console.log( cards[i])
    }
  }
}
)

function toggleCheckbox() {
  var input = this.querySelector("input")
  
  if (this.classList.contains("border-success")) {
    this.classList.remove("border-success")
    input.checked = false
  } else {
    this.classList.add("border-success")
    input.checked = true
  }
}
document.addEventListener('turbolinks:load', function () {
  var controls = document.querySelectorAll(".form-inline-btn")
  var form = document.querySelector(".form-inline")

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener("click", formInlineLinkHandler)
    }
  }

  var errors = document.querySelector(".resource-errors")

  if (form && errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHandler(resourceId)
  }
})

function formInlineLinkHandler(e) {
  e.preventDefault()
  
  var testId = this.dataset.testId
  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  var link = document.querySelector(`.form-inline-btn[data-test-id="${ testId }"]`)
  var testTitle = document.querySelector(`.test-title[data-test-id="${ testId }"]`)
  var formInline = document.querySelector(`.form-inline[data-test-id="${ testId }"]`)

  if (formInline.classList.contains("hide")) {
    testTitle.classList.add("hide")
    formInline.classList.remove("hide")
    link.textContent  = link.textContent == "Редактировать" ? "Отменить" : "Cancel"
  } else {
    link.textContent  = link.textContent == "Отменить" ? "Редактировать" : "Edit"
    testTitle.classList.remove("hide")
    formInline.classList.add("hide")
  }
}
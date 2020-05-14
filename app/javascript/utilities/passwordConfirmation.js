document.addEventListener("turbolinks:load", function () {
  var passwordConfirmationInput = document.querySelector(
    ".password-form-confirmation"
  );

  if (passwordConfirmationInput) {
    passwordConfirmationInput.addEventListener("input", passwordConfirmation);
  }
});

function passwordConfirmation() {
  var passwordInput = document.querySelector(".password-form");

  if (!this.value || !passwordInput) {
    warningText = this.parentNode.querySelector("small");
    warningText.classList.add("hide");
    this.classList.remove("border-danger");
    this.classList.remove("border-success");
  } else if (this.value === passwordInput.value) {
    warningText = this.parentNode.querySelector("small");

    warningText.classList.remove("hide", "text-danger");
    warningText.classList.add("text-success");
    warningText.textContent = "Passwords is OK";

    this.classList.remove("border-danger");
    this.classList.add("border-success");
  } else {
    warningText = this.parentNode.querySelector("small");

    warningText.classList.remove("hide", "text-success");
    warningText.classList.add("text-danger");
    warningText.textContent = "Passwords don't match";

    this.classList.remove("border-success");
    this.classList.add("border-danger");
  }
}

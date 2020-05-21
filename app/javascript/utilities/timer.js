document.addEventListener("turbolinks:load", () => {
  var timer = document.querySelector(".timer");

  if (timer) {
    if (timer.textContent == 0) {
      timer.textContent = "Без ограничений по времени";
    } else {
      startTimer(timer);
    }
  }
});

function startTimer(timer) {
  var seconds = timer.dataset.minutes * 60;
  timer.textContent = fmtMSS(seconds);

  setInterval(() => {
    if (seconds > 0) {
      seconds -= 1;
      timer.textContent = fmtMSS(seconds);
    }
  }, 1000);
}

function fmtMSS(s) {
  return (s - (s %= 60)) / 60 + (9 < s ? ":" : ":0") + s;
}

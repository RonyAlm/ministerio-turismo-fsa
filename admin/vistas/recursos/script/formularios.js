document.addEventListener("DOMContentLoaded", function () {
  const element = document.querySelector(".bs-stepper");
  if (element) {
    window.stepper = new Stepper(element);
  } else {
    console.error("Element not found in DOM");
  }
});

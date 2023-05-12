const togglePassword = document.querySelector("#togglePasswordtablas");
const password = document.querySelector("#inputPasswordtablas");

togglePassword.addEventListener("click", function (e) {
  const type =
    password.getAttribute("type") === "password" ? "text" : "password";
  password.setAttribute("type", type);
  this.classList.toggle("fa-eye-slash");
});
const togglePassword1 = document.querySelector("#togglePasswordtablas1");
const password1 = document.querySelector("#inputPasswordtablas1");

togglePassword1.addEventListener("click", function (e) {
  const type =
    password1.getAttribute("type") === "password" ? "text" : "password";
  password1.setAttribute("type", type);
  this.classList.toggle("fa-eye-slash");
});

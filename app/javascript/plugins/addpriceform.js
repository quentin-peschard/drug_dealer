function addForm() {
  const buttons = document.querySelectorAll(".price-edit")
  buttons.forEach((button) => {
     button.addEventListener("click", function (e) {
       console.log(e.currentTarget.nextElementSibling);
       e.currentTarget.nextElementSibling.classList.remove("hidden")
       e.currentTarget.classList.add('hidden')
     });
  })
}

export { addForm };

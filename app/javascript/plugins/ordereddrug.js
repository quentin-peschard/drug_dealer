function addDrug() {
  const drugCardContainers = document.querySelectorAll('.card-container')
  const overLay = document.querySelector(".overlay");
  drugCardContainers.forEach((cardContainer) => {
    const card = cardContainer.querySelector('.card-product');
    const popUp = cardContainer.querySelector(".fixed-element");
    card.addEventListener("click", function(e) {
      overLay.classList.remove("hidden");
      popUp.classList.remove('hidden')
    })
  })
}

export { addDrug };

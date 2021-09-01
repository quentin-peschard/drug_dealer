function exitThing() {
  const drugCardContainers = document.querySelectorAll(".card-container");
  const overLay = document.querySelector(".overlay");
  drugCardContainers.forEach((cardContainer) => {
    const exitThing = cardContainer.querySelector(".exit-thing-div");
    const popUp = cardContainer.querySelector(".fixed-element");
    exitThing.addEventListener("click", function (e) {
      overLay.classList.add("hidden");
      popUp.classList.add("hidden");
    });
  });
}

export { exitThing };

function exitThing() {
  const exitThing = document.querySelector(".exit-thing-div")
  const fixedThing = document.querySelector(".fixed-element")
  const overLay = document.querySelector(".overlay");
  exitThing.addEventListener("click", function (e) {
    fixedThing.classList.add('hidden')
    overLay.classList.add('hidden');
     });
}

export { exitThing };

import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [];

  connect() {

  }

  updateCart(event) {
    event.preventDefault();
    const currentElement = event.currentTarget;
    fetch(currentElement.href, {
      headers: { 'Accept': 'application/json' }
    })
    .then(response => response.json())
    .then((data) => {
        const targetedElement = document.querySelector(currentElement.dataset.drugQuantity);
        targetedElement.innerText = data.quantity;
    })
  }
}

import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus";
import { exitThing } from "./exit_thing";
import { addDrug } from '../plugins/ordereddrug';

export default class extends Controller {
  static targets = ["drugList"];

  connect() {

  }

  addToOrder(event) {
    event.preventDefault();
    event.stopPropagation();
    const element = event.currentTarget;
    fetch(element.href, {
        method: 'POST',
        headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
        body: {}
    })
    .then(response => response.json())
    .then((data) => {
        this.drugListTarget.innerHTML = data.html;
        document.querySelector('.overlay').classList.add("hidden");
        document.querySelector('.action-bar').insertAdjacentHTML('beforeend', `<div class='total'>${data.ordered_drugs_count}</div>`)
        addDrug();
        exitThing();
    })
  }
}

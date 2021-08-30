// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { csrfToken } from "@rails/ujs";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = []

  connect() {
    // console.log('drugs index controller')
  }

  // create(event) {
  //   event.preventDefault();
  //   const drugId = event.target.dataset.drugId
  //   const orderId = event.target.dataset.orderId

  //   fetch(`/orders/${orderId}/ordered_drugs?drug_id=${drugId}`, {
  //     method: 'POST',
  //     headers: { 'Accept': "application/json", 'X-CSRF-Token': csrfToken() },
  //   })
  //     .then(response => response.json())
  //     .then((data) => {
  //       console.log(data)
  //     });
  // }
}

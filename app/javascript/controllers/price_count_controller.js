import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-count"
export default class extends Controller {
  static targets= ["start", "end", "price", "total", "total1"]
  static values = {
    price: String
  }

  connect() {
    console.log("start",this.startTarget);
    console.log("end",this.endTarget);
    console.log("price",this.priceTarget);
    console.log("price value",this.priceValue);
  }
  calculate() {
    let date_1 = new Date(this.startTarget.value);
    let date_2 = new Date(this.endTarget.value);

    let difference = date_2.getTime() - date_1.getTime();
    let TotalDays = Math.ceil(difference / (1000 * 3600 * 24));
    if (this.startTarget.value && this.endTarget.value) {
      this.priceTarget.innerHTML = `${this.priceValue } € x ${TotalDays } days`
      this.totalTarget.innerHTML = `<strong> ${this.priceValue * TotalDays } €</strong>`
      this.total1Target.innerHTML = `<strong> ${this.priceValue * TotalDays } €</strong>`
    }

  }
}

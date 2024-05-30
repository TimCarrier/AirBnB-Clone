import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      inline: true,
      dateFormat: "Y-m-d",
      "disable": [
        function(date) {
          return (date.getDay() === Math.floor(Math.random() * 7) || date.getDay() === Math.floor(Math.random() * 7));
        }
      ],
      "locale": {
        "firstDayOfWeek": 1
      }
    });
  }
}

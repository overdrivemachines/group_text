import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["btnTemplate1", "btnTemplate2", "txtAreaMessage"];
  connect() {
    console.log("connected!!!!!");
    // this.element.textContent = "Hello World!";

    // this.btnTemplate1Target.textContent = "Hello";
  }

  loadMessage1(event) {
    event.preventDefault();
    console.log("hello1");
    this.txtAreaMessageTarget.value = "This is Jillian with Sierra Geotech...";
  }

  loadMessage2(event) {
    event.preventDefault();
    console.log("hello2");
    this.txtAreaMessageTarget.value = "Following up to see if any inspections are needed tomorrow";
  }
}

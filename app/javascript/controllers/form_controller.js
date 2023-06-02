import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
static targets = ["gender", "egg", "noise"]

  connect() {
    console.log("Hi from form")

    console.log(this.genderTarget, this.eggTarget)

  }

  checkGender(event){
     if(event.currentTarget.value == "male"){
      this.eggTarget.classList.add("d-none")
     }
     else if (event.currentTarget.value == "female"){
      if(this.eggTarget.classList.contains("d-none")){
        this.eggTarget.classList.remove("d-none")
      }
       this.noiseTarget.classList.add("d-none")
     }
     else {
        if(this.eggTarget.classList.contains("d-none")){
          this.eggTarget.classList.remove("d-none")
        }

        if(this.noiseTarget.classList.contains("d-none")){
          this.noiseTarget.classList.remove("d-none")
        }
    }
  }


  changeOutput(){

  }
}

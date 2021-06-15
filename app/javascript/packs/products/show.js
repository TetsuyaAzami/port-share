import "../../src/stylesheets/products/show.scss";




function submitEvent() {
  const submit = document.querySelector("input[type='submit']");
  submit.addEventListener("click", () => {
    const checkBoxList = document.querySelectorAll("input[type='checkbox']");
    let checkedCount = 0;
    checkBoxList.forEach((checkbox) => {
      if (checkbox.checked === true) {
        checkedCount++;
      }
    });
    if (checkedCount === 0) {
      checkBoxList.forEach((checkbox) => {
        checkbox.required = true;
      });
    } else {
      checkBoxList.forEach((checkbox) => {
        checkbox.required = false;
      });
    }
    document.querySelector(".check-boxes").addEventListener(
      "invalid",
      function (e) {
        if (checkbox.validity.valueMissing) {
          e.target.setCustomValidity("最低でも1つはチェックしてください。");
        }
      },
      false
    );
  });
}

window.addEventListener("DOMContentLoaded", submitEvent);
window.addEventListener("beforeunload", submitEvent);

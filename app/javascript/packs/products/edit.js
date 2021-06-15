const submit = document.querySelector("input[type='submit']");
const checkBoxList = document.querySelectorAll("input[type='checkbox']");

submit.addEventListener("click", () => {
  let checkedCount = 0;
  checkBoxList.forEach((checkbox) => {
    if (checkbox.checked === true) {
      checkedCount++;
    }
  });
  if (checkedCount === 0) {
    checkBoxList[0].setCustomValidity("最低でも1つはチェックしてください。");
  } else {
    checkBoxList[0].setCustomValidity("");
  }
});

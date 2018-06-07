function onclickfn() {
  if (document.getElementById('radio_staff').checked) {
    window.open("StaffRegistration.html");
  } else if (document.getElementById('radio_student').checked) {
    window.open("StudentRegistration.html");
  } else {
    alert("Select user!")
  }
}

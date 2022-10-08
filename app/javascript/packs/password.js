document.addEventListener('turbolinks:load', function() {

  var passwordConfirmation = document.getElementById('user_password_confirmation')

  if (passwordConfirmation) { passwordConfirmation.addEventListener('input', checkPassword) }

})

function checkPassword() {

  var verified = document.querySelector('.octicon-verified')
  var unverified = document.querySelector('.octicon-unverified')

  if (!this.value) {
    success.classList.add('hide')
    unverified.classList.add('hide')
    return
  }

  if (document.getElementById('user_password').value == this.value) {
    verified.classList.remove('hide')
    unverified.classList.add('hide')
  } else {
    verified.classList.add('hide')
    unverified.classList.remove('hide')
  }
}
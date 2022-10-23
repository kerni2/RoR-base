document.addEventListener('turbolinks:load', function() {
  var progressBar = document.querySelector('.progress-bar')

  if (!progressBar) { return }

  var progress = Math.round((
                 progressBar.dataset.currentQuestion
                 / progressBar.dataset.questionsCount )
                 * 100 )

  progressBar.style.setProperty('width', progress + '%')
})

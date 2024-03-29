document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')
  
  if (control) {control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  // var table = document.querySelector('table')
  // NodeList
  var tbody = document.querySelector('tbody')
  var rows = tbody.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-sort-asc').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-sort-asc').classList.remove('hide')
    this.querySelector('.octicon-sort-desc').classList.add('hide')
  }   else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-sort-asc').classList.add('hide')
    this.querySelector('.octicon-sort-desc').classList.remove('hide') 
  }

  // var sortedTable = document.createElement('table')
  var sortedTable = document.createElement('tbody')
  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  tbody.parentNode.replaceChild(sortedTable, tbody)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return -1}
  if (testTitle1 > testTitle2) { return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) { return 1}
  if (testTitle1 > testTitle2) { return -1}
  return 0
}
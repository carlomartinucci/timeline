const ready = () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
  $('.dropdown-toggle').dropdown()

  $(document).on('click', '#fetchMkm', function() {
    $('#fetchMkm').replaceWith('')
    console.log('fetch mkm')
    $.ajax('/users/fetch_mkm_stock_changes', { method: 'POST' })
  })
}

document.addEventListener('turbolinks:load', ready)

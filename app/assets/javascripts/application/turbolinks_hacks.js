// Turbolinks remote form display errors
// https://github.com/turbolinks/turbolinks/issues/85
// ----------------------------------------------------------------------------
$.rails.ajax = (options) => {
  return $.ajax(options).done((response, status, xhr) => {
    if (response && (xhr.getResponseHeader('Content-Type') || '').substring(0, 9) === 'text/html') {
      const referrer = window.location.href
      Turbolinks.controller.cache.put(referrer, Turbolinks.Snapshot.wrap(response))
      Turbolinks.visit(referrer, { action: 'restore' })
    }
  })
}

// Turbolinks re-enable data-disable-with on redirects
// https://github.com/rails/rails/issues/29473
// ----------------------------------------------------------------------------
const remoteForm = 'form[method!=get][data-remote=true]'
$(document).on('ajax:complete', remoteForm, (event, xhr) => {
  if (xhr.responseText.substring(0, 10) === 'Turbolinks') {
    // This is a turbolink redirect, so re-disable the form until turbolinks
    // fetches the new page.
    $.rails.disableFormElements($(event.target))
  } else {
    // Handle if there was a form error... possible solutions in
    // https://github.com/turbolinks/turbolinks/issues/85
  }
})

// Turbolinks persist scroll
// https://stackoverflow.com/questions/39679154/how-to-persist-scrolls-with-turbolinks/51790464#51790464
// ----------------------------------------------------------------------------
const turbolinksPersistScroll = () => {
  const persistScrollDataAttribute = 'turbolinks-persist-scroll'
  let scrollPosition
  let enabled = false

  document.addEventListener('turbolinks:before-visit', (event) => {
    if (enabled)
      scrollPosition = window.scrollY
    else
      scrollPosition = null
    enabled = false
  })

  document.addEventListener('turbolinks:load', (event) => {
    const elements = document.querySelectorAll(`[data-${persistScrollDataAttribute}="true"]`)
    for (let i = 0; i < elements.length; i++) {
      elements[i].addEventListener('click', () => {
        enabled = true
      })
    }

    if (scrollPosition)
      window.scrollTo(0, scrollPosition)
  })
}
turbolinksPersistScroll()

// Remove Flash messages before cache the page
// https://github.com/turbolinks/turbolinks/issues/303#issuecomment-312385584
// ----------------------------------------------------------------------------
document.addEventListener('turbolinks:before-cache', () => {
  document.querySelectorAll('.flash').forEach(flashContainer => flashContainer.remove())
})

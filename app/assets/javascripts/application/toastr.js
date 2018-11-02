import toastr from 'toastr'

toastr.options = {
  positionClass:     'toast-top-left',
  preventDuplicates: true,
  timeOut:           5000,
  closeButton:       true
}

global.toastr = toastr
export default toastr

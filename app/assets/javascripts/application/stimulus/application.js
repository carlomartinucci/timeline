import { Application }      from 'stimulus'
import FlashController      from 'application/stimulus/flash_controller'
import FileFieldController  from 'application/stimulus/file_field_controller'
import FormController       from 'application/stimulus/form_controller'
import NestedFormController from 'application/stimulus/nested_form_controller'

const application = Application.start()

application.register('flash', FlashController)
application.register('file-field', FileFieldController)
application.register('form', FormController)
application.register('nested-form', NestedFormController)

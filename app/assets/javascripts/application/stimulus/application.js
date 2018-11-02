import { Application }            from 'stimulus'
import FlashController            from 'application/stimulus/flash_controller'
import FileFieldController        from 'application/stimulus/file_field_controller'

const application = Application.start()

application.register('flash', FlashController)
application.register('file-field', FileFieldController)

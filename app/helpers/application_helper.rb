module ApplicationHelper
  def active_class(path)
    if path.match?(/^\//)
      current_page?(path) ? 'active' : ''
    else
      controller_name == path ? 'active' : ''
    end
  end

  def help(title, message, placement: 'top')
    tag.i('', class: 'fas fa-question-circle', title: title, data: { toggle: 'popover', content: "<small>#{message}</small>", html: true, placement: placement })
  end

  def subheader(breadcrumbs, &_block)
    content_tag(:div, class: 'd-none d-sm-flex row subheader') do
      concat(content_tag(:div, class: 'col-sm') do
        content_tag(:nav) do
          content_tag(:ol, class: 'breadcrumb') do
            breadcrumbs.each do |name, link|
              concat(content_tag(:li, link_to(name, link), class: 'breadcrumb-item'))
            end
          end
        end
      end)
      if block_given?
        concat(content_tag(:div, class: 'col-sm-3') do
          yield
        end)
      end
    end
  end

  def error_message(obj, field)
    if obj.errors[field.to_sym].present?
      content_tag :div, class: 'invalid-feedback' do
        obj.errors[field.to_sym].first
      end
    end
  end

  def decoration_image(file_name, klass: nil, size: 'md')
    size = "decoration-image--#{size}"
    content_tag :span, class: "decoration-image #{klass} #{size}" do
      concat(content_tag(:span, nil, class: 'decoration-image__overlay'))
      concat(image_tag(file_name))
    end
  end

  def disable_with_html(text)
    return "<i class='spinner'></i> #{text}".html_safe
  end

  def changes_go_live
    '<div class="text-right text-info"><i class="fas fa-info"></i> It may take some minutes before the changes go live.</div>'.html_safe
  end

  def datetimepicker form, field, value
    id = "dtp-#{SecureRandom.hex[0..6]}"
    label = form.label field
    input = form.text_field field,
      class: "form-control datetimepicker-input",
      id: id,
      autocomplete: 'off',
      data: { toggle: "datetimepicker", target: "##{id}" }
    js = content_for :javascript_page do
      "<script>
        document.addEventListener('turbolinks:load', function(){
          $('##{id}').datetimepicker({
            defaultDate: #{value&.strftime('%d/%m/%Y')},
            viewMode: 'years',
            format: 'DD/MM/YYYY'
          });
        });
      </script>".html_safe
    end
    label + input + js
  end
end

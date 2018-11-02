class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  after_action :set_timestamp_header

  # Permission redirects

  rescue_from CanCan::AccessDenied do |exception|
    session[:redirect_access_denied] = request.original_url
    cookies[:redirect_access_denied] = request.original_fullpath
    if request.format.json?
      render json: { error: exception.message }, status: :forbidden
    elsif current_user
      redirect_to root_path, alert: exception.message
    else
      redirect_to new_user_session_path, alert: I18n.t('unauthorized.unlogged')
    end
  end

  rescue_from ActionController::InvalidAuthenticityToken do
    head :forbidden
  end
  rescue_from ActionController::ParameterMissing do
    head :not_acceptable
  end
  rescue_from ActionController::UnknownFormat do
    head :not_acceptable
  end

  # Common actions

  def http_error
    @error = params[:error].to_i
    respond_to do |format|
      format.html { render 'application/http_error', status: @error }
      format.all { render head: true, body: nil, status: @error }
    end
  end

  def clear_cache
    raise ActionController::RoutingError.new('Not Found') if !current_user&.admin?

    Rails.cache.clear
    redirect_back(fallback_location: backoffice_root_path, notice: 'Cache was successfully cleared')
  end

  def root
    render plain: 'ok'
  end

  protected

    def after_sign_in_path_for(resource)
      invalid_redirect_url = %w[/users/sign_up /users/sign_in /users/confirmation /users/password /users/unlock]
      redirects = [params[:redirect_to], request.env['omniauth.origin'], session[:redirect_access_denied], request.referer, super]
      redirect = redirects.compact.uniq.reject { |url| invalid_redirect_url.inject(false) { |x, y| x || url.include?(y) } }.first
      session[:redirect_access_denied] = nil
      if request.env['omniauth.params']&.any?
        uri = URI.parse(redirect)
        query_string = Rack::Utils.parse_nested_query(uri.query).merge(request.env['omniauth.params'])
        uri.query = query_string.to_query
        redirect = uri.to_s
      end

      redirect
    end

    def set_timestamp_header
      if request.headers['X-Timestamp'].present?
        response.headers['X-Timestamp'] = request.headers['X-Timestamp']
      end
    end

    def configure_devise_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me) }
    end
end

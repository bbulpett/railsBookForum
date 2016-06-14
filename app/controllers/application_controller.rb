class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :block_ip_addresses

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  private

  def authorize
  	redirect_to login_url, alert: "Not Authorized" if current_user.nil?
  end

  def is_admin
    redirect_to root_path, alert: "Not authorized" if current_user.nil? or !current_user.admin?
  end

  def block_ip_addresses
    head :unauthorized if current_ip_address == "184.154.139.9"
  end

  def current_ip_address
    request.env['HTTP_X_REAL_IP'] || request.env['REMOTE_ADDR']
  end

  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name   = "LearningRails5"
    title       = [controller_name, action_name].join(" ")
    description = "Learning Rails 5 - Available from O'Reilly Media"
    image       = options[:image] || "/assets/images/book-icon.jpg"
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
      site:        site_name,
      title:       title,
      image:       image,
      description: description,
      keywords:    %w[ruby rails 5 web software development oreilly locklear learning education app],
      twitter: {
        site_name: site_name,
        site: 'http://www.learningRails5.com',
        card: 'If you’re a web developer or designer ready to learn Ruby on Rails, this unique book is the ideal way to start. All you need to get started is a little HTML experience. Each chapter includes exercises and review questions to test your understanding as you go.',
        description: description,
        image: image
      },
      og: {
        url: current_url,
        site_name: site_name,
        title: title,
        image: image,
        description: description,
        type: 'website'
      }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end

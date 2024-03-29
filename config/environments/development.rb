Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Default url for mailer
  config.action_mailer.default_url_options = { host: "f320e889b9514d6ab3bb098a86760e9f.vfs.cloud9.ap-northeast-1.amazonaws.com"}
  # メール送信失敗時のエラーを発生させる
  config.action_mailer.raise_delivery_errors = true
  # メール送信にSMTPを使用する
  config.action_mailer.delivery_method = :smtp
  # SMPTの詳細設定
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 587,
    # HELOコマンドで使用するドメイン、たぶん無くてもok
    domain: 'smtp.gmail.com',
    # Gmailのメールアドレス
    user_name: ENV['GOOGLE_MAIL_ADDRESS'],
    # Googleのアプリパスワード
    password: ENV['GOOGLE_APP_PASSWORD'],
    # メールサーバーの認証の種類
    authentication: 'plain',
    # STARTTLSを自動検出して有効化
    enable_starttls_auto: true,
    #tls: false,
    enable_starttls: true,
    open_timeout:    5,
    read_timeout:    5,
  }
end
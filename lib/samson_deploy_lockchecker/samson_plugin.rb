require_relative '../lockchecker_mailer'
module SamsonDeployLockchecker
  class Engine < ::Rails::Engine
  end
end


Samson::Hooks.callback :release_deploy_conditions do |stage, release|
  locked = stage.locked?
  run_auto_deploy = !locked
  LockcheckerMailer.deliver_failed_email(release, stage) if locked
  run_auto_deploy
end

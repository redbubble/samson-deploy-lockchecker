require_relative '../lockchecker_email'
module SamsonDeployLockchecker
  class Engine < ::Rails::Engine
  end
end


Samson::Hooks.callback :release_deploy_conditions do |stage, release|
  locked = stage.locked?
  LockcheckerMailer.deliver_failed_email(release, stage) if locked
  !locked
end

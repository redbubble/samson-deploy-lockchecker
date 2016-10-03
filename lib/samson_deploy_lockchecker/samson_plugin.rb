module SamsonDeployLockchecker
  class Engine < ::Rails::Engine
  end
end


Samson::Hooks.callback :release_deploy_conditions do |stage, release|

  Lockchecker.new.run_auto_deploy?(release, stage)
end

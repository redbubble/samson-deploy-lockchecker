require_relative '../lockchecker_mailer'

module SamsonDeployLockchecker
  class Lockchecker
    def initialize(mailer=nil)
      @mailer = mailer
    end

    def run_auto_deploy?(release, stage)
      stage_lock = stage.lock
      locked = !!stage_lock && !stage_lock.warning?
      auto_deploy = !locked
      lockchecker_mailer.deliver_failed_email(release, stage) if locked
      auto_deploy
    end

    private
    def lockchecker_mailer
      @mailer ||= LockcheckerMailer
    end
  end
end

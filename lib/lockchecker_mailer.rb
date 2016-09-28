module LockcheckerMailer
  def self.deliver_failed_email(release, stage)
    emails = release.changeset.commits.map(&:author_email).uniq
    Rails.logger.info "Sending auto deploy lock email"
    ReleaseMailer.lockchecker_email(release, stage, emails).deliver_now
    Rails.logger.info "AUTO-DEPLOY lock email sent to to #{emails.join(',')}"
  end
end

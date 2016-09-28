class ReleaseMailer < ApplicationMailer
  add_template_helper(DeploysHelper)
  add_template_helper(ApplicationHelper)

  def lockchecker_email(release, stage, emails)
    prepare_mail(release, stage)

    mail(
      to: emails,
      subject: "[NO-AUTO-DEPLOY] Your code change to #{@release.project.name} is not deployed to #{@stage.name} because deployment is locked.",
      template_name: "lockchecker_email"
    )
  end


  private

  def prepare_mail(release, stage)
    @release = release
    @stage = stage
    @project = @release.project
    @changeset = @release.changeset
  end
end

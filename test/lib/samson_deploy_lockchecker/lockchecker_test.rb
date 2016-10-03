require_relative '../../test_helper'
require 'ostruct'

describe SamsonDeployLockchecker::Lockchecker do
  describe '#run_auto_deploy?' do
    let(:release) { mock() }
    let(:subject) { SamsonDeployLockchecker::Lockchecker.new(mailer) }

    describe 'stage is locked' do
      let(:stage) { OpenStruct.new(locked?: true)}
      let(:mailer) do
        mock = Minitest::Mock.new
        mock.expect(:deliver_failed_email, true, [release, stage])
        mock
      end
      it 'is false is stage is locked' do
        result = subject.run_auto_deploy?(release, stage)
        mailer.verify
        assert_equal false, result
      end
    end

    describe 'stage is unlocked' do
      let(:stage) { OpenStruct.new(locked?: false)}
      let(:mailer) { Minitest::Mock.new }

      it 'is true is staged is unlocked' do
        result = subject.run_auto_deploy?(release, stage)
        mailer.verify
        assert_equal true, result
      end
    end
  end
end

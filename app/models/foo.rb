class Foo < ActiveRecord::Base
  serialize :jids, Array

  def do_job
    test_jids = []


    jids << "s"
    test_jids << "s"
    Rails.logger.info("s has been pushed")
    Rails.logger.info(jids)
    Rails.logger.info(test_jids)

    jids << BarWorker.perform_in(10.minutes, self.id)
    test_jids << BarWorker.perform_in(10.minutes, self.id)
    Rails.logger.info("normal worker has been pushed")
    Rails.logger.info(jids)
    Rails.logger.info(test_jids)

    jids << FooMailer.delay_for(10.minutes).confirm_foo(self)
    test_jids << FooMailer.delay_for(10.minutes).confirm_foo(self)
    Rails.logger.info("mailer worker id pushed")
    Rails.logger.info(jids)
    Rails.logger.info(test_jids)

    jids
  end



  def do_job_with_assignment
    test_jids = []

    jids << "s"
    test_jids << "s"
    Rails.logger.info("s has been pushed")
    Rails.logger.info(jids)
    Rails.logger.info(test_jids)


    bar_worker_jid = BarWorker.perform_in(10.minutes, self.id)
    jids << bar_worker_jid

    test_bar_worker_jid = BarWorker.perform_in(10.minutes, self.id)
    test_jids << test_bar_worker_jid
    Rails.logger.info("normal worker has been pushed")
    Rails.logger.info(jids)
    Rails.logger.info(test_jids)

    foo_mailer_jid = FooMailer.delay_for(10.minutes).confirm_foo(self)
    jids << foo_mailer_jid

    test_foo_mailer_jid = FooMailer.delay_for(10.minutes).confirm_foo(self)
    test_jids << test_foo_mailer_jid
    Rails.logger.info("mailer worker id pushed")
    Rails.logger.info(jids)
    Rails.logger.info(test_jids)

    jids
  end
end

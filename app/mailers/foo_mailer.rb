class FooMailer < ActionMailer::Base
  default from: "from@example.com"


  def confirm_foo(foo)
    @foo = foo
  end
end

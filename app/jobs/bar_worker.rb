class BarWorker
  include Sidekiq::Worker

  def perform(foo_id)
    foo = Foo.find foo_id
    foo.title = "baz"
    foo.save!
  end

end

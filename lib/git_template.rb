class ExampleCommand
  def initialize(context)
    @context = context
  end

  def method_missing(method_name, *args, &block)
    if @context.respond_to?(method_name, true)
      @context.send(method_name, *args, &block)
    else
      super
    end
  end

  def call
    send(:after_bundle) do
      git(:init)
      git(add: '.')
      git(commit: %Q{ -m "Initial commit - github" })
    end
  end
end

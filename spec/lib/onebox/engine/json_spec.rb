require "spec_helper"

describe Onebox::Engine::JSON do
  before(:all) do
    @link = "http://gist.github.com"
    fake(@link, response("github_gist"))
  end
  before(:each) { Onebox.defaults.cache.clear }

  let(:link) { @link }

  describe "#raw" do
    class OneboxEngineDee
      include Onebox::Engine::JSON

      def initialize(link)
        @url = link
      end
    end

    it "returns a hash" do
      object = OneboxEngineDee.new("http://gist.github.com").send(:raw)
      expect(object).to be_a(Hash)
    end
  end
end
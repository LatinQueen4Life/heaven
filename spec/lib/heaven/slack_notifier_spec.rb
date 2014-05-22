require 'spec_helper'

describe "Heaven::Notifier::Slack" do
  it "handles pending notifications" do
    n = Heaven::Notifier::Slack.new(JSON.parse(fixture_data("deployment-pending")))
    expect(n.default_message).to \
      eql "[atmos](https://github.com/atmos) is deploying [my-robot](https://github.com/atmos/my-robot/tree/break-up-notifiers) to production"
  end

  it "handles successful deployment statuses" do
    n = Heaven::Notifier::Slack.new(JSON.parse(fixture_data("deployment-success")))
    expect(n.default_message).to \
      eql "[atmos](https://github.com/atmos)'s production deployment of [my-robot](https://github.com/atmos/my-robot) is done! "
  end

  it "handles failure deployment statuses" do
    n = Heaven::Notifier::Slack.new(JSON.parse(fixture_data("deployment-failure")))
    expect(n.default_message).to \
      eql "[atmos](https://github.com/atmos)'s production deployment of [my-robot](https://github.com/atmos/my-robot) failed. "
  end
end

module IssueWallComponents
  module Github
    class IssuePresenter

      attr_reader :issue

      def initialize issue
        @issue = issue
      end

      def created_at
        @created_at_formatted ||= Time.parse(issue.created_at).in_time_zone('Melbourne').strftime('%A %d %B %Y %I:%M:%S %p')
      end

      def body
        issue.body
      end

      def method_missing(method, *args, &block)
        if self.respond_to?(method)
          self.send(method, *args, &block)
        else
          issue.send(method, *args, &block)
        end
      end
    end
  end
end

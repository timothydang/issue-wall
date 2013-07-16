module IssueWallComponents
  module Github
    class Issue

      def initialize gc
        @gc = gc
      end

      def all
        @gc.github.issues.all(user: 'hooroo', repo: 'hotels', per_page: 100).map do |issue|
          IssuePresenter.new(issue)
        end
      end
    end
  end
end

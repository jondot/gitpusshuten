module GitPusshuTen
  module Commands
    class Tag < GitPusshuTen::Commands::Base
      description "Pushes the specified tag to a remote."
      usage       "push <tag> to <environment>"
      example     "push 1.4.2 to production"

      ##
      # Tag specific attributes/arguments
      attr_accessor :tag

      ##
      # Initializes the Tag command
      def initialize(*objects)
        super
        perform_hooks!
        
        @tag = cli.arguments.shift
        
        help if tag.nil? or environment.name.nil?
      end

      ##
      # Performs the Tag command
      def perform!
        git.push(:tag, tag).to(environment.name)
      end

    end
  end
end
# TODO: Wrap the schema lib under ai-agents
# So we can extend it as Agents::Schema
class Captain::ResponseSchema < RubyLLM::Schema
  string :response, description: 'The message to send to the user'
  string :reasoning, description: "Agent's thought process"

  def self.with_message_length_limit(message_length_limit)
    RubyLLM::Schema.create do
      string :response,
             description: "The message to send to the user in #{message_length_limit} characters or fewer",
             pattern: "^[\\s\\S]{1,#{message_length_limit}}$"
      string :reasoning, description: "Agent's thought process"
    end
  end
end

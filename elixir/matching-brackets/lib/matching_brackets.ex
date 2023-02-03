defmodule MatchingBrackets do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(str) do
    stack =
      Enum.reduce(to_charlist(str), [], fn char, stack ->
        case stack do
          nil ->
            nil

          _ ->
            [head | tail] = if stack === [], do: [nil, nil], else: stack
            case {char, head} do
              {?[, _} -> [char | stack]
              {?{, _} -> [char | stack]
              {?(, _} -> [char | stack]
              {?], ?[} -> tail
              {?}, ?{} -> tail
              {?), ?(} -> tail
              {?], _} -> nil
              {?}, _} -> nil
              {?), _} -> nil
              _ -> stack
            end
        end
      end)
    stack !== nil and stack === []
  end
end
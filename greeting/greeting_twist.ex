defmodule GreetingTwist do
  def greeting do
   answer = IO.gets "Hello, what is your name?"
   case String.trim(answer) do
     "Kobus" -> replyK = IO.gets "Why hello there are you my creator?\n"
      case String.trim(replyK) do
        "yes" -> ~s{I am glad I have finally met you.}
        "no" -> ~s{Kobus must be a popular name then.}
        _ -> ~s{Sorry I can only handle "no" or "yes"}
      end
      _ -> ~s{Hello #{answer}, I am glad to have met you}
   end
  end
end

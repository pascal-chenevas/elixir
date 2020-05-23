defmodule Dictionary do

  alias Dictionary.WordList
  @moduledoc """
   Dictionary Module 
  """
  defdelegate random_word(), to: WordList
end

defmodule Dictionary.WordList do
  @moduledoc """
     Read file contains a list of words

    ## Examples

     iex> words = Dictionary.start()
     ["word_1", "word_2", "word_n"]

     iex> Dictionary.random_word(words)
     "word_10"
  """

  @me __MODULE__
  def start_link() do
    Agent.start_link(&word_list/0, name: @me)
  end
    
  def random_word() do
    Agent.get(@me, &Enum.random/1)
  end
  
  def word_list() do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end

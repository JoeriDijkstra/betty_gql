defmodule BettyGql.Queries.DataQueries do
  @doc """
  Generates the query to retrieve all objects of a given type
  """
  def all_query(type, fields, filter) do
    """
    {
      all#{upcaseFirst type}(where: {#{filter}}){
        results{
          #{for x <- fields do
            "#{x}\n      "
          end}
        }
      }
    }
    """
  end

  def one_query(type, fields, filter) do
    """
    {
      one#{upcaseFirst type}(where: {#{filter}}){
          #{for x <- fields do
            "#{x}\n      "
          end}
      }
    }
    """
  end

  defp upcaseFirst(<<first::utf8, rest::binary>>), do: String.upcase(<<first::utf8>>) <> rest

end

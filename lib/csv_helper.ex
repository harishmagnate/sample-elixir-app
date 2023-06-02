defmodule CSVHelper do
  @moduledoc ~S"""
  A csv file, but may be customized to have different separators.

  Headers are extracted from the data elements.

  Options:
    * `:separator` - between fields, defaults to `,`. Must be given as a codepoint.
    * `:delimiter` - between rows, defaults to `\r\n`
  """

  @enforce_keys [:name, :headers, :rows]
  defstruct name: nil, headers: nil, rows: nil, separator: ?,, delimiter: "\r\n"

  def new(data, name, opts \\ []) do
    encoded = split_data(data)

    params =
      [
        name: name,
        headers: encoded.headers,
        rows: encoded.rows,
        separator: opts[:separator],
        delimiter: opts[:delimiter]
      ]
      |> Enum.reject(fn {_k, v} -> is_nil(v) end)

    if params[:separator] && not is_integer(params[:separator]) do
      raise ArgumentError,
            "Separator must be given as a codepoint. You probably want the `?` operator"
    end

    struct!(__MODULE__, params)
  end

  defp split_data(data) do
    data = if Keyword.keyword?(data), do: [data], else: List.wrap(data)

    first = List.first(data)

    unless (is_map(first) and not is_struct(first)) or Keyword.keyword?(first),
      do: raise("elements must be maps or keyword lists, got: #{inspect(first)}")

    headers = Enum.map(first, fn {k, _v} -> k end)

    rows = data |> Enum.map(fn entry -> Enum.map(entry, fn {_k, v} -> v end) end)

    %{headers: headers, rows: rows}
  end

  def encode(%__MODULE__{} = csv) do
    data =
      CSV.encode([csv.headers] ++ csv.rows, separator: csv.separator, delimiter: csv.delimiter)
      |> Enum.join()

    {csv.name, data}
  end
end

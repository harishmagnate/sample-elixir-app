defmodule Phone do
  @moduledoc """
  A standard 10-digit US phone number.

  Construction removes any non-digit characters and a leading 1.

  Stored as a 10-digit string in the database
  """

  @enforce_keys [:phone]
  defstruct @enforce_keys

  @type t :: %__MODULE__{
          phone: String.t()
        }

  def new(phone) when is_integer(phone), do: phone |> Integer.to_string() |> new()

  def new(phone) when is_binary(phone) do
    phone
    |> sanitize()
    |> validate_format()
    |> case do
      {:error, _} = error -> error
      phone -> {:ok, %__MODULE__{phone: phone}}
    end
  end

  def new!(phone) do
    case new(phone) do
      {:ok, phone} -> phone
      {:error, message} -> raise message
    end
  end

  def to_string(%__MODULE__{phone: phone}), do: phone

  @doc """
  Format a phone number into our standard format `(555) 555-5555`
  """
  def format(phone) do
    phone
    |> __MODULE__.to_string()
    |> String.replace(~r/(\d{3})(\d{3})(\d{4})/, "(\\1) \\2-\\3")
  end

  defp sanitize(phone) when is_binary(phone) do
    phone
    |> String.replace(~r/\D/, "")
    |> String.replace(~r/^1/, "")
  end

  defp validate_format(phone) when is_binary(phone) do
    if String.match?(phone, ~r/[2-9]\d{9}/) do
      phone
    else
      {:error, "Expected 10 digits not starting with a 1"}
    end
  end

  defmacro sigil_p({:<<>>, _meta, [phone]}, _modifiers) when is_binary(phone) do
    phone
    |> Phone.new!()
    |> Macro.escape()
  end

  @doc """
  Stored as a 10 digit string
  """
  def type, do: :string

  @doc """
  Changeset cast and query
  """
  def cast(%__MODULE__{} = phone), do: {:ok, phone}

  def cast(phone) when not is_binary(phone) and not is_integer(phone), do: :error

  def cast(phone) do
    phone
    |> new()
    |> Error.map(&List.wrap/1)
  end

  @doc """
  From db
  """
  def load(phone) when is_binary(phone) or is_integer(phone), do: new(phone)
  def load(_), do: :error

  @doc """
  To db
  """
  def dump(%__MODULE__{phone: phone}), do: {:ok, phone}
  def dump(_), do: :error
end

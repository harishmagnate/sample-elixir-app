defmodule BuildXml do
  @moduledoc """
  Documentation for `BuildXml`.
  """

  import XmlBuilder

  @doc """
  Hello world.

  ## Examples
      iex -S mix
      iex> BuildXml.hello()
      :world

  """
  def hello do
    "Hello World"
  end

  @doc """
  Hello world.

  ## Examples
      iex -S mix
      iex> BuildXml.buildxml()
      :world

  """
  def buildxml do
    generate(build_profile_container(12, "first", "last"))
  end

  # BuildXml.buildxml()
  def build_profile_container(id, first, last) do
    element(
      :profileContainer,
      [
        "xmlns:xsd": "http://www.w3.org/2001/XMLSchema",
        "xmlns:xsi": "http://www.w3.org/2001/XMLSchema-instance"
      ],
      [
        element(:payloadContainerType, "Profile"),
        create_header(),
        element(
          :profile,
          [
            create_profile_entity()
          ]
        )
      ]
    )
  end

  # BuildXml.buildxml()
  defp create_header() do
    element(
      :header,
      [
        element(:profileType, "Source"),
        element(:dataKey, "SYS122.13780073"),
        element(:topEntityName, "PARTY"),
        element(:notes)
      ]
    )
  end

  # BuildXml.buildxml()
  defp create_profile_entity do
    element(
      :entity,
      %{name: "PARTY"},
      [
        element(:attr, %{name: "SOURCE_PKEY"}, "SYS122.13780073"),
        element(:attr, %{name: "SYSTEM_ID"}, 122),
        element(:attr, %{name: "FIRST_NAME"}, "Qkciynk"),
        element(:attr, %{name: "MIDDLE_NAME"}, "L"),
        element(:attr, %{name: "LAST_NAME"}, "Kbuysecg"),
        element(:attr, %{name: "GENDER"}, "Female"),
        element(:attr, %{name: "DATE_OF_BIRTH"}, "19590509"),
        create_address_entity()
      ]
    )
  end

  # BuildXml.buildxml()
  defp create_address_entity() do
    element(
      :entity,
      %{name: "ADDRESS"},
      [
        element(:attr, %{name: "SOURCE_PKEY"}, "SYS122.13780073.Home"),
        element(:attr, %{name: "SOURCE_PKEY_PARENT"}, "SYS122.13780073"),
        element(:attr, %{name: "SYSTEM_ID"}, 122),
        element(:attr, %{name: "ADDRESS_LINE_1"}, "E Red Oak Dr"),
        element(:attr, %{name: "ADDRESS_LINE_2"}),
        element(:attr, %{name: "CITY"}, "Memphis"),
        element(:attr, %{name: "REGION"}, "TN"),
        element(:attr, %{name: "POST_CODE"}, "38112")
      ]
    )
  end
end

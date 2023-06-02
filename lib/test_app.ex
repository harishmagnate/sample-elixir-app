defmodule TestApp do
  @moduledoc """
  Documentation for `TestApp`.
  """

  @doc """
  Hello world.

  ## Examples
      iex -S mix
      iex> TestApp.filter_cspi_id()
      :world

  """
  def filter do
    json = get_json("sample_response_2.json")

    data =
      json
      |> get_member_info()

    data
  end

  @doc """
  Hello world.

  ## Examples
      iex -S mix
      iex> TestApp.filter_recent_ee_benefit()
      :world

  """
  def filter_recent_ee_benefit() do
    data = [
      %{
        "benefitCreatedDate" => "2023-05-05 08:30:06.000",
        "benefitDescription" => "Essentials Benefit - 7480 - Transportation",
        "benefitEffectiveDate" => "2023-05-03 00:00:00.000",
        "benefitTermDate" => "2199-12-31 00:00:00.000",
        "benefitUpdatedDate" => "2023-05-05 08:30:06.000",
        "memberId" => "158M97355"
      },
      %{
        "benefitCreatedDate" => "2022-09-29 07:58:20.000",
        "benefitDescription" => "Essentials Benefit - 7480 - Transportation",
        "benefitEffectiveDate" => "2022-09-28 00:00:00.000",
        "benefitTermDate" => "2022-09-28 00:00:00.000",
        "benefitUpdatedDate" => "2023-05-05 08:30:06.000",
        "memberId" => "158M97355"
      }
    ]

    filter_recent_benefits({:ok, data})
  end

  def filter_recent_benefits({:ok, []}), do: {:ok, []}

  def filter_recent_benefits({:ok, data}) do
    update_date_max_entry = filter_recent_benefit(data, "benefitUpdatedDate")
    create_date_max_entry = filter_recent_benefit(data, "benefitCreatedDate")
    IO.inspect(update_date_max_entry)
    IO.inspect(create_date_max_entry)

    if transform_edh_date(update_date_max_entry, "benefitUpdatedDate") >
         transform_edh_date(create_date_max_entry, "benefitCreatedDate") do
      {:ok, [update_date_max_entry]}
    else
      {:ok, [create_date_max_entry]}
    end
  end

  defp filter_recent_benefit(edh_response, field),
    do: Enum.max_by(edh_response, &transform_edh_date(&1, field), DateTime)

  defp transform_edh_date(edh_data, field) do
    {:ok, date_time, _t} = "#{Map.get(edh_data, field)}Z" |> DateTime.from_iso8601()

    date_time
  end

  ## TestApp.filter_cspi_id()
  def filter_cspi_id do
    json = get_json("planid_lookup.json")

    json
    |> get_cspi_info()
  end

  defp get_cspi_info(cspi_details) do
    file = File.open!("C:/work/test_file.csv", [:write, :utf8])

    # pcik the most recent effective active entry; for inactive, first one will always be more recent
    data =
      cspi_details
      |> Map.get("masterData")
      |> Enum.map(fn benefit ->
        cspi_id = Map.get(benefit, "planId")
        product_desc = Map.get(benefit, "productDescription")
        dofr_id = Map.get(benefit, "productId")

        # IO.inspect("#{cspi_id}  #{dofr_id}  #{product_desc}")

        %{
          cspi_id: cspi_id,
          dofr_id: dofr_id,
          product_desc: product_desc
        }
      end)
      |> CSVHelper.new("C:/work/test_file.csv")
      |> CSVHelper.encode()
      |> Enum.to_list()
      |> Enum.each(&IO.write(file, &1))
  end

  defp get_member_info(member_details) do
    # pcik the most recent effective active entry; for inactive, first one will always be more recent
    active_info =
      member_details |> Map.get("memberInfo") |> Enum.reject(&(Map.get(&1, "active") === false))

    inactive_info =
      member_details
      |> Map.get("memberInfo")
      |> Enum.reject(&Map.get(&1, "active"))
      |> List.first()

    filter_future_active(active_info, inactive_info)
  end

  defp filter_future_active(nil, inactive_info), do: inactive_info
  defp filter_future_active([], inactive_info), do: inactive_info

  defp filter_future_active(active_info, _inactive_info) do
    active_info
    |> Enum.reject(&filter_future_active_info(&1))
    |> Enum.sort_by(&sort_by_eff_dt(&1), :desc)
    |> List.first()
  end

  defp sort_by_eff_dt(member_details) do
    member_details["memberDemographics"]
    |> Enum.at(0)
    |> get_effective_date()
  end

  defp get_effective_date(nil), do: nil
  defp get_effective_date(member_demographics), do: member_demographics["memberPlanEffectiveDate"]

  defp filter_future_active_info(member_info) do
    member_info
    |> Map.get("memberDemographics")
    |> List.first()
    |> fetch_future_active_plans()
  end

  defp fetch_future_active_plans(health_plan) do
    if Map.get(health_plan, "memberPlanEffectiveDate") > Date.utc_today() do
      health_plan
    else
      nil
    end
  end

  defp get_json(filename) do
    path = Path.join([__DIR__, "/#{filename}"])
    with {:ok, body} <- File.read(path), {:ok, json} <- Poison.decode(body), do: json
  end
end

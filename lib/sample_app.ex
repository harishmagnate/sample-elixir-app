defmodule SampleApp do
  @moduledoc """
  Documentation for `SampleApp`.
  """

  def extract do
    data = %{
      :current_event => %{
        "DATE_OF_DEATH" => nil,
        "PRODUCT_ID" => "H1300015",
        "MBR_ID" => "975I17961",
        "MEMBER_ACTIVE_HEALTH_PLAN" => "ANTHEM MEDIBLUE ESRD CARE (HMO C-SNP)",
        "MBR_PHONE_7" => nil,
        "MBR_MAIL_ADDR_LINE1" => nil,
        "MEMBER_ACTIVE_HEALTH_PLAN_EFFECTIVE_DATE" => "2023-02-21",
        "GROUP_NAME" => "Anthem Blue Cross",
        "MBR_PHONE_1" => "5423861495",
        "PRODUCT_DESC" => "Anthem MediBlue ESRD Care (Los Angeles/Orange County)",
        "BUSINESS_MODEL" => "CareMore Health Network",
        "LOB" => "Medicare",
        "MBR_DOB" => "1955-01-01",
        "MBR_HOME_ZIP" => "90023",
        "GROUP_ID" => "H0544",
        "MBR_MAIL_ZIP" => nil,
        "FILE_INDICATOR" => "1",
        "MBR_PHONE_2" => nil,
        "MBR_PHONE_3" => "7144744963",
        "REGION_NAME" => "LOS ANGELES-ORANGE COUNTY",
        "MBR_PHONE_8" => nil,
        "MBR_MAIL_ADDR_LINE2" => nil,
        "MBR_MEDICARE_ID" => "1DY2T34VG12",
        "MBR_FIRST_NAME" => "Qsnwqpr",
        "COUNTY_NAME" => "Los Angeles",
        "MBR_HOME_ADDR_LINE1" => "BESWICK ST APT",
        "MBR_HOME_STATE" => "CA",
        "MBR_MAIL_STATE" => nil,
        "MBR_PHONE_4" => nil,
        "CLIENT_NAME" => "Anthem Inc.",
        "MEMBER_ACTIVE_HEALTH_PLAN_TERM_DATE" => "2099-12-31",
        "MBR_LAST_NAME" => "CmCaPatient",
        "NEIGHBORHOOD" => "CA Orange Brea Placentia Linda",
        "MBR_PHONE_5" => nil,
        "MBR_MAIL_CITY" => nil,
        "IS_ACTIVE" => "1",
        "CLASSPLAN_PRODUCT_ID" => "H1300015",
        "CAREMORE_ID" => "1625",
        "MBR_HOME_ADDR_LINE2" => nil,
        "MARKET" => "California",
        "METAL_TIER" => nil,
        "MBR_HOME_CITY" => "Los Angeles",
        "MBR_PHONE_6" => nil,
        "HEALTH_PLAN" => "Anthem Inc.",
        "MBR_GENDER" => "M"
      },
      {"recreate_trip_4000012", :create_trip_notes} => [],
      {"recreate_trip_4000014", :create_trip} => %{
        pickup_time: nil,
        pickup_phone_ext: nil,
        spoke_to: nil,
        pickup_name: "Qsnwqpr CmCaPatient",
        pickup_address_2: nil,
        contact_relation_id: 80815,
        trip_status_id: 40000,
        cancel_ind: false,
        destn_city: "Los Angeles",
        destn_type_id: 598,
        destn_state: "CA",
        modified_by: "00515000006lz3QAAQ",
        nbr_of_escorts: 0,
        subscriber_id: "975I17961",
        id: 4_000_019,
        appt_type_id: 1,
        destn_zip_code: "90017",
        created_by: "00515000006lz3QAAQ",
        pickup_phone: "1679814937",
        pickup_state: "CA",
        vendor_id: 50000,
        empty_appt_time: true,
        pickup_zip_code: "90023",
        pickup_address_1: "BESWICK ST APT",
        modified_at: ~N[2023-02-10 06:05:47]
      },
      {"edit_trip_status_4000015", :update_trip_status} => {1, nil},
      {"edit_trip_status_4000012", :is_gurney_trip_type} => false,
      {"recreate_trip_4000012", :filter_carrier_trip_notes} => [],
      {"edit_trip_status_4000014", :trip_file_details} => %{
        destn_st_addr: "303 S Union Ave",
        appt_dt: "03/13/2023",
        pickup_phone_nbr: "1679814937",
        pickup_phone_ext: nil,
        account_nbr: "4040",
        cancelled: "Y",
        file_number: "2",
        passenger_type: "A",
        destn_city: "Los Angeles",
        destn_state: "CA",
        modified_by: "00515000006lz3QAAQ",
        pickup_zipcode: "90023",
        destn_zipcode: "90017",
        psngr_lname: "CmCaPatient",
        nbr_of_escorts: 0,
        appt_type_id: 1,
        created_by: "00515000006lz3QAAQ",
        pickup_st_addr: "BESWICK ST APT",
        trip_id: 4_000_014,
        pickup_state: "CA",
        pickup_dt: "03/13/2023",
        psngr_fname: "Qsnwqpr",
        dialysis: "N",
        mobile_nbr: nil,
        copay: 0.0,
        requested_by: "qwerty",
        destn_phone_nbr: "2133552600",
        file_name: "0004000014_002.txt",
        trip_type: "AM",
        pickup_city: "LOS ANGELES",
        patient_id: "001dxirZlUK6v51AUB",
        psngr_id: "975I17961",
        carrier_cd: "CO3",
        destn_phone_ext: nil
      },
      {"edit_trip_status_4000013", :verify_should_trasmit_file} => %{
        destn_st_addr: "BESWICK ST APT",
        appt_dt: "03/10/2023",
        pickup_phone_nbr: "2133552600",
        pickup_phone_ext: nil,
        pickup_comment: nil,
        general_trip_comments: nil,
        account_nbr: 4040,
        cancelled: "Y",
        file_number: 2,
        passenger_type: "A",
        is_sent: false,
        destn_city: "LOS ANGELES",
        destn_state: "CA",
        modified_by: "00515000006lz3QAAQ",
        pickup_zipcode: "90017",
        destn_zipcode: "90023",
        psngr_lname: "CmCaPatient",
        nbr_of_escorts: 0,
        appt_type_id: 1,
        created_by: "00515000006lz3QAAQ",
        pickup_st_addr: "303 S Union Ave",
        trip_id: 4_000_013,
        pickup_state: "CA",
        modified_at: ~N[2023-02-10 06:05:46.715000],
        pickup_dt: "03/10/2023",
        psngr_fname: "Qsnwqpr",
        dialysis: "N",
        mobile_nbr: nil,
        copay: 0.0,
        requested_by: "qwerty",
        id: nil,
        destn_phone_nbr: "1679814937",
        will_return_call: "N",
        file_name: "0004000013_002.txt",
        trip_type: "AM",
        pickup_city: "Los Angeles",
        patient_id: "001dxirZlUK6v51AUB",
        psngr_id: "975I17961",
        carrier_cd: "CO3",
        destn_phone_ext: nil,
        receipt_date: nil,
        created_at: ~N[2023-02-10 06:05:46.715000]
      }
    }

    IO.inspect(Map.get(data, :previous_event))
    # key = {"recreate_trip_4000014", :create_trip}
    IO.inspect(Map.get(data, {"recreate_trip_4000014", :create_trip}))
    IO.inspect(Map.has_key?(data, {"recreate_trip_4000014", :create_trip}))
  end

  @doc """
  Hello world.

  ## Examples
      iex -S mix
      iex> SampleApp.hello()
      :world

  """
  def hello do
    json = get_json("sample_response.json")
    IO.inspect(json)

    data =
      json
      |> Map.get("benefitDetails")
      |> Enum.map(&Map.get(&1, "memberId"))
      |> Enum.uniq()

    File.write("response.json", Poison.encode!(data), [:binary])
    data
  end

  @doc """
  Compare List.

  ## Examples
      iex -S mix
      iex> SampleApp.compare_obj_enum()
      :world
  """
  @valid_sources ["EST", "Nexus-Lexus", "APG", "ePub", "ePub - Preferred"]
  def compare_obj_enum do
    api_patient_contact_phones = [
      %{
        type: "Phone",
        purpose: "Alt",
        number: "(745) 921-9799",
        systemID: 8,
        system: "eHub",
        lastUpdateDate: "2022-08-30T11:54:42.613",
        callingPreference: nil,
        cellPhone: nil,
        validPhoneNumber: nil,
        dncSource: "RND",
        isEHubPreferred: "Yes"
      },
      %{
        type: "Phone",
        purpose: "Cell",
        number: "(745) 557-3579",
        systemID: 8,
        system: "ADT",
        lastUpdateDate: "2022-08-30T11:54:42.613",
        callingPreference: nil,
        cellPhone: nil,
        validPhoneNumber: nil,
        dncSource: "Consent",
        isEHubPreferred: nil
      },
      %{
        type: "Phone",
        purpose: "Cell",
        number: "(703) 557-3579",
        systemID: 8,
        system: "Lexis-Nexis",
        lastUpdateDate: "2022-08-30T11:54:42.613",
        callingPreference: nil,
        cellPhone: nil,
        validPhoneNumber: nil,
        dncSource: "Wrong Number",
        isEHubPreferred: nil
      }
    ]

    plan_patient_contact_phones = [
      %{
        type: "Home",
        phone: "7459219799",
        source: "EMR",
        dnd_status: "Consent to Call"
      },
      %{
        type: "Home",
        phone: "7455573579",
        source: "ADT",
        dnd_status: "Reassigned Number"
      }
    ]

    transformed_api_phones =
      api_patient_contact_phones
      |> Enum.map(&transform_api_response(&1))
      |> Enum.reject(&(&1.source not in @valid_sources))

    final_list =
      plan_patient_contact_phones
      |> Enum.filter(fn plan_phone ->
        filter_existing_phones(plan_phone, transformed_api_phones)
      end)

    existing_list = update_dnd_status_on_existing_phones(final_list, transformed_api_phones)

    response =
      transformed_api_phones
      |> Enum.reject(fn api_phone ->
        prepare_new_contact_phones(api_phone.phone, final_list)
      end)
      |> Enum.map(&prepare_contact_phones_for_insert(&1))

    IO.inspect(existing_list)
    response
  end

  # SampleApp.compare_obj_enum()
  defp prepare_new_contact_phones(phone, final_list) do
    final_list
    |> Enum.filter(fn final -> final.phone == phone end)
    |> List.first()
    |> verify_phone_exists(phone)
  end

  defp verify_phone_exists(nil, _phone), do: false
  defp verify_phone_exists(_existing_phone, nil), do: false
  defp verify_phone_exists(existing_phone, phone), do: existing_phone.phone == phone

  defp prepare_contact_phones_for_insert(new_phone) do
    %{
      phone: new_phone.phone,
      type: new_phone.type,
      source: new_phone.source,
      dnd_status: new_phone.dnd_status,
      primary: false,
      active: true
    }
  end

  defp update_dnd_status_on_existing_phones(
         plan_patient_contact_phones,
         formatted_api_patient_contact_phones
       ) do
    plan_patient_contact_phones
    |> Enum.map(fn plan_phone ->
      update_plan_dnd_status(plan_phone, formatted_api_patient_contact_phones)
    end)
  end

  # SampleApp.compare_obj_enum()
  defp update_plan_dnd_status(plan_phone, formatted_api_patient_contact_phones) do
    api_patient_contact_phone =
      formatted_api_patient_contact_phones
      |> Enum.filter(&(&1.phone == plan_phone.phone))
      |> List.first()

    %{plan_phone | dnd_status: api_patient_contact_phone.dnd_status}
  end

  defp transform_api_response(api_response) do
    %{
      phone: api_response[:number] |> prepare_phone(),
      type: api_response[:purpose],
      source: api_response[:system] |> prepare_source(api_response[:isEHubPreferred]),
      dnd_status: api_response[:dncSource] |> map_to_plan_dnd_status()
    }
  end

  # SampleApp.compare_obj_enum()
  defp filter_existing_phones(api_contact_phone, plan_contact_phones) do
    plan_contact_phones
    |> Enum.any?(fn plan_contact_phone -> plan_contact_phone.phone == api_contact_phone.phone end)
  end

  defp prepare_phone(phone_number) do
    {:ok, phone} = Phone.new(phone_number)
    phone.phone
  end

  defp prepare_source(_system, "Yes"), do: "eHub - Preferred"
  defp prepare_source(system, _is_ehub_preferred), do: system

  @dnc_source_dnd_status %{
    "Consent" => "Consent to Call",
    "Wrong Number" => "Wrong Number",
    "RND" => "Reassigned Number",
    "Do Not Call" => "Do Not Call"
  }

  defp map_to_plan_dnd_status(nil), do: nil

  defp map_to_plan_dnd_status(dnc_source) do
    @dnc_source_dnd_status
    |> Map.get(dnc_source)
  end

  @doc """
  Compare List.

  ## Examples
      iex -s mix
      iex> SampleApp.compare_list()
      :world

  """
  def compare_list do
    data_a = [
      %{
        patient_id: "000M82177",
        benefit_description: "Dental Vision Hearing",
        effective_date: "2022-01-01 00:00:00.000",
        term_date: "2199-12-31 00:00:00.000"
      },
      %{
        patient_id: "000M86621",
        benefit_description: "Health and Fitness Tracker",
        effective_date: "2022-03-19 00:00:00.000",
        term_date: "2199-12-31 00:00:00.000"
      },
      %{
        patient_id: "000M95181",
        benefit_description: "Flex Account - Dental Vision Hearing",
        effective_date: "2022-01-01 00:00:00.000",
        term_date: "2199-12-31 00:00:00.000"
      }
    ]

    data_b = [
      %{
        patient_id: "000M97305",
        benefit_description: "In Home Support",
        effective_date: "2022-07-06 00:00:00.000",
        term_date: "2199-12-31 00:00:00.000"
      },
      %{
        patient_id: "000M86621",
        benefit_description: " Health and Fitness Tracker",
        effective_date: "2022-03-19 00:00:00.000",
        term_date: "2199-12-31 00:00:00.000"
      },
      %{
        patient_id: "000M95181",
        benefit_description: "Flex Account - Dental Vision Hearing",
        effective_date: "2022-01-01 00:00:00.000",
        term_date: "2199-12-31 00:00:00.000"
      }
    ]

    data_diff_a = data_a |> Enum.reject(fn x -> Enum.member?(data_b, x) end)
    data_diff_b = data_b |> Enum.reject(fn x -> Enum.member?(data_a, x) end)
    [data_diff_a, data_diff_b]
  end

  defp get_json(filename) do
    path = Path.join([__DIR__, "/#{filename}"])
    with {:ok, body} <- File.read(path), {:ok, json} <- Poison.decode(body), do: json
  end
end
